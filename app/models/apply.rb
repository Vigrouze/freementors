class Apply < ApplicationRecord
  belongs_to :mission
  belongs_to :padawan, class_name: "User"

  enum status: { pending: 0, accepted: 1, denied: 2 }

  validates :motivation, length: { in: 10..200 }
  validates :padawan, uniqueness: { scope: :mission }

  before_save :update_mission_padawan

  def update_mission_padawan
    mission.update!(padawan_id: padawan.id, status: 0) if status == "accepted"
  end
end
