class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :relationships_as_padawan, class_name: "Relationship", foreign_key: :padawan_id
  has_many :relationships_as_mentor, class_name: "Relationship", foreign_key: :mentor_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :missions_as_mentor, class_name: "Mission", foreign_key: :mentor_id
  has_many :missions_as_padawan, class_name: "Mission", foreign_key: :padawan_id

  has_many :application_requests, class_name: "Apply", foreign_key: :padawan_id
  # will return a collection of all the applies of a user
  has_many :applied_missions, class_name: "Mission", through: :application_requests, source: :mission
  # will return a collection of all the missions where the user applied

  scope :mentor, -> { where(mentor: true) }

  def not_yet_applied?(mission)
    applied_missions.where(id: mission.id).empty?
    # will return true if a user hasn't applied yet to a mission
  end
end
