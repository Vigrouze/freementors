class Relationship < ApplicationRecord
  belongs_to :padawan, class_name: "User"
  belongs_to :mentor, class_name: "User"

  enum status: [pending: 0, accepted: 1, denied: 2]
end
