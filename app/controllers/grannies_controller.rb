class GranniesController < ApplicationController
  def index
    @grannies = Granny.all
  end

  def show
    @reservation = Reservation.new
    @review = Review.new
  end

  def new
    @granny = Granny.new
  end

  def create
    @granny = Granny.new(granny_params)
    @granny.user = current_user
    if @granny.save
      redirect_to @granny, notice: "Granny created successfully."
    else
      render :new
    end
  end

  private

  def set_granny
    @granny = Granny.find(params[:id])
  end

  def granny_params
    params.require(:granny).permit(:name, :bio, :price, :location, :available, :photo)
  end
end
