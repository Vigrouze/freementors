class Relationship < ApplicationRecord
  belongs_to :user

  enum status: [:pending, :accepted, :denied]
end
