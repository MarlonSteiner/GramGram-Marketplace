class Reservation < ApplicationRecord
  belongs_to :granny
  belongs_to :user

  enum status: { pending: "pending", confirmed: "confirmed", cancelled: "cancelled" }

  validates :start_date, :end_date, :status, presence: true
  validate :end_date_after_start_date
  validate :does_not_overlap_existing_reservations

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def does_not_overlap_existing_reservations
    return if start_date.blank? || end_date.blank?

    overlapping = granny.reservations.where.not(id: id).where(
      "(start_date < ?) AND (end_date > ?)", end_date, start_date
    )

    if overlapping.exists?
      errors.add(:base, "Granny is already booked during that time")
    end
  end

  def duration_in_days
    (end_date - start_date).to_i
  end

  def total_price
    granny.price * duration_in_days
  end
end
