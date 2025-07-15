# app/controllers/reservations_controller.rb
class ReservationsController < ApplicationController
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

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
