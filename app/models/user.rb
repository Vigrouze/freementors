class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :relationships_as_padawan, class_name: "Relationship", foreign_key: :padawan_id
  has_many :not_connected_relationships_as_padawan, -> { where.not status: :accepted }, class_name: "Relationship", foreign_key: :padawan_id

  has_many :relationships_as_mentor, class_name: "Relationship", foreign_key: :mentor_id
  has_many :accepted_relationships, -> { where status: :accepted }, class_name: "Relationship", foreign_key: :padawan_id

  has_many :mentors, class_name: "User", foreign_key: :padawan_id, through: :accepted_relationships
  has_many :applied_mentors, class_name: "User", foreign_key: :padawan_id, through: :not_connected_relationships_as_padawan, source: :mentor
  acts_as_taggable_on :tags

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :missions_as_mentor, class_name: "Mission", foreign_key: :mentor_id
  has_many :missions_as_padawan, class_name: "Mission", foreign_key: :padawan_id

  after_validation :set_tags # see private function
  scope :mentor, -> { where(mentor: true) }

  # Constant for filter and forms if we need
  SKILLS = { frontend: ["HTML", "CSS", "JavaScript", "React", "Angular", "Vue", "JQuery", "Swift", "SASS", "Elm"],
             backend: ["PHP", "Ruby", "Java", "C#", "C++", "Python", "Julia", "Scala", "Perl", "Kotlin"] }

  has_many :application_requests, -> { where.not status: :accepted }, class_name: "Apply", foreign_key: :padawan_id
  # will return a collection of all the applies of a user
  has_many :applied_missions, class_name: "Mission", through: :application_requests, source: :mission
  # will return a collection of all the missions where the user applied

  # pgsearch
  include PgSearch::Model
  pg_search_scope :search_by_last_name_and_skills,
    against: [ :last_name ],
    associated_against: {
      tags: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  def name
    "#{first_name} #{last_name}"
  end


  def not_yet_applied?(mission)
    applied_missions.where(id: mission.id).empty?
    # will return true if a user hasn't applied yet to a mission
  end

  def relationship_request_status(mentor)
    relation = relationships_as_padawan.find_by(mentor_id: mentor.id)

    relation ? relation.status : ""
  end

  def connected?(mentor)
    relationships_as_padawan.connected.where(mentor_id: mentor.id).any?
  end

  private

  # adding frontend & backend automatically, not duplication if already existing
  def set_tags
    tag_list.each do |tag|
      SKILLS.each do |key, value|
        if value.include?(tag) && !tag_list.include?(key)
          tag_list.add(key)
        end
      end
    end
  end
end
