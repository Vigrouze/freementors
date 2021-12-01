class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :padawan, class_name: "User"
  belongs_to :mentor, class_name: "User"

  validates :padawan, uniqueness: { scope: :mentor, message: "conversation already created"}
end
