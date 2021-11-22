class Mission < ApplicationRecord
  belongs_to :mentor, class_name: "User"
  belongs_to :padawan, class_name: "User", optional: true

  enum status: [ :not_started, :on_going, :finished ]

  validates :name, :company, :start_date, :end_date, :description, :fee, :remote, presence: true
  validates :fee, :status, numericality: { only_integer: true }
  validate end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
