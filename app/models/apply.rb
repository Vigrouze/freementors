class Apply < ApplicationRecord
  belongs_to :mission
  belongs_to :padawan, class_name: "User"

  enum status: { pending: 0, accepted: 1, denied: 2 }

  validates :padawan, uniqueness: { scope: :mission }

  before_save :update_mission_padawan, :send_message_to_mentor

  def update_mission_padawan
    mission.update!(padawan_id: padawan.id, status: 0) if status == "accepted"
  end

  def send_message_to_mentor
    if Chatroom.find_by(padawan_id: padawan.id, mentor_id: mission.mentor.id).nil?
      chatroom = Chatroom.create(padawan_id: padawan.id, mentor_id: mission.mentor.id)
    else
      chatroom = Chatroom.find_by(padawan_id: padawan.id, mentor_id: mission.mentor.id)
    end

    message = Message.new(
      chatroom_id: chatroom.id,
      user_id: padawan.id,
      content: "Hello #{mission.mentor.first_name}, I've just applied to your mission \"#{mission.name}\". \n
      #{motivation}"
    )
    message.save!
  end
end
