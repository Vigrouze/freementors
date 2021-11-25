class Apply < ApplicationRecord
  belongs_to :mission
  belongs_to :padawan, class_name: "User"

  validates :motivation, length: { in: 10..200 }
  validates :padawan, uniqueness: { scope: :mission }
end
