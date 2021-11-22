class Apply < ApplicationRecord
  belongs_to :mission
  belongs_to :padawan, class_name: "User"

  validates :motivation, length: { mininmum: 10 }

end
