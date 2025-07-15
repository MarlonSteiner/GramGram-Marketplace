class DashboardController < ApplicationController
  def bookings
    @reservations = current_user.reservations.includes(:granny)
  end

  def listings
    @grannies = current_user.grannies.includes(reservations: :user)
  end
end
