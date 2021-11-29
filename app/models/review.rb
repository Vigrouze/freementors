class Review < ApplicationRecord
  belongs_to :mission
  belongs_to :reviewer, class_name: "User", foreign_key: 'reviewer_id'
  belongs_to :reviewee, class_name: "User", foreign_key: 'reviewee_id'

  validates :reviewer, :reviewee, :rating, presence: true
  validates :content, length: { in: 10..500 }
  validates :rating, numericality: { only_integer: true }
  # validation between 0 and 5
  validates_inclusion_of :age, { in: 0..5 }
end
