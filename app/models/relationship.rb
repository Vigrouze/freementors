class Relationship < ApplicationRecord
  belongs_to :padawan, class_name: "User", foreign_key: 'padawan_id'
  belongs_to :mentor, class_name: "User", foreign_key: 'mentor_id'
  validates :padawan, uniqueness: { scope: :mentor, message: "You already connected"}

  enum status: { pending: 0, accepted: 1, denied: 2 }

  scope :connected, -> { where(status: :accepted) }
  scope :pending, -> { where(status: :pending) }
  scope :not_connected, -> { where(status: :denied) }

  after_update :build_notification

  private

  def build_notification
    # Vérifier le statut de la relation
    if self.accepted?
      mentor = User.find(self.mentor_id)
      receiver = User.find(self.padawan_id)

      @notification = {
        title: "Connected with #{mentor.first_name}",
        on_click_url: Rails.application.routes.url_helpers.mentor_path(mentor),
        user_id: receiver.id
      }

      Notification.create(@notification)
    end
  end
end
