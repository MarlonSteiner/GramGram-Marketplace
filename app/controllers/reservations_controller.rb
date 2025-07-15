# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
  before_action :authorize_owner!, only: [:confirm, :cancel]

  def new
    @granny = Granny.find(params[:granny_id])
    @reservation = Reservation.new
  end

  def create
    @granny = Granny.find(params[:granny_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.granny = @granny
    @reservation.user = current_user
    @reservation.status = "pending"

    if @reservation.save
      redirect_to dashboard_bookings_path, notice: "Reservation sent!"
    else
      render "grannies/show", status: :unprocessable_entity
    end
  end

  def confirm
    @reservation = Reservation.find(params[:id])
    if @reservation.granny.user == current_user
      @reservation.update(status: "confirmed")
      redirect_to dashboard_listings_path, notice: "Reservation confirmed!"
    else
      redirect_to dashboard_listings_path, alert: "Not authorized"
    end
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    if @reservation.granny.user == current_user
      @reservation.update(status: "cancelled")
      redirect_to dashboard_listings_path, notice: "Reservation cancelled."
    else
      redirect_to dashboard_listings_path, alert: "Not authorized"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def authorize_owner!
  @reservation = Reservation.find(params[:id])
  unless @reservation.granny.user == current_user
    redirect_to root_path, alert: "You are not authorized to perform this action."
  end
end
