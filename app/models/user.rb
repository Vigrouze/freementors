class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :relationships_as_padawan, class_name: "Relationships", foreign_key: :padawan_id
  has_many :relationships_as_mentor, class_name: "Relationships", foreign_key: :mentor_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
