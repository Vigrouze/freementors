class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :padawan, class_name: "User"
  belongs_to :mentor, class_name: "User"
end
