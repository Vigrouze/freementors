class Mission < ApplicationRecord
  belongs_to :mentor
  belongs_to :padawan
end
