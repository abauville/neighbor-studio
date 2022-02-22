class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_after_start?
  # validates :end_date, presence: true, numericality: { greater_than: :start_date} # doesn't work on dates

  # validates :start_date, comparison: { greater_than: :end_date } # works only in rails 7
  enum status: {
    pending: 0,
    accepted: 1,
    refused: 2
  }

  def end_after_start?
    if start_date > end_date
      errors.add(:end_date, "should be later than the start date")
    end
  end
end
