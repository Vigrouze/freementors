class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :relationships_as_padawan, class_name: "Relationships", foreign_key: :padawan_id
  has_many :relationships_as_mentor, class_name: "Relationships", foreign_key: :mentor_id
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
