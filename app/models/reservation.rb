class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :granny

  # validates :start_date, :end_date, :status, presence: true
  # validate :end_date_after_start_date

  enum status: { pending: "pending", confirmed: "confirmed", cancelled: "cancelled" }

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def duration_in_days
    (end_date - start_date).to_i
  end

  def total_price
    granny.price * duration_in_days
  end
end
