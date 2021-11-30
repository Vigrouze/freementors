class Mission < ApplicationRecord
  belongs_to :mentor, class_name: "User"
  belongs_to :padawan, class_name: "User", optional: true
  acts_as_taggable_on :tags

  has_many :applies, dependent: :destroy
  has_many :reviews, dependent: :destroy

  enum status: { not_started: 0, on_going: 1, finished: 2 }

  validates :name, :company, :start_date, :end_date, :description, :fee, :remote, presence: true
  validates :fee, numericality: { only_integer: true }
  validate :end_date_after_start_date

  before_save :calculate_duration

  def application_status(user)
    application = applies.find_by(padawan_id: user.id)

    application ? application.status : ""
  end

  private


  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "Must be after the start date.")
    end
  end

  def calculate_duration
    self.duration = (end_date - start_date).to_i
  end
end
