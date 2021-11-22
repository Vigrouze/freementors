class Relationship < ApplicationRecord
  belongs_to :user

  enum status: [pending: 0, accepted: 1, denied: 2]
end
