class GranniesController < ApplicationController
  def index
    @grannies = Granny.all
    # The `geocoded` scope coordinates
    @markers = @grannies.geocoded.map do |granny|
      {
        lat: granny.latitude,
        lng: granny.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { granny: granny })
      }
    end
  end

  def show
    @granny = Granny.find(params[:id])
    @reservation = Reservation.new
    @reviews = @granny.reviews
    @review = Review.new
    @average_rating = @reviews.average(:rating)
    # The `geocoded` scope coordinates
    @markers =
      [
        lat: @granny.latitude,
        lng: @granny.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { granny: @granny })
      ]
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
