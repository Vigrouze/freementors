class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :padawan, class_name: "User"
  belongs_to :mentor, class_name: "User"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
