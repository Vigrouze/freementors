class Relationship < ApplicationRecord
  belongs_to :padawan, class_name: "User", foreign_key: 'padawan_id'
  belongs_to :mentor, class_name: "User", foreign_key: 'mentor_id'

  enum status: { pending: 0, accepted: 1, denied: 2 }

  scope :connected, -> { where(status: :accepted) }
  scope :pending, -> { where(status: :pending) }
  scope :not_connected, -> { where(status: :denied) }

end
