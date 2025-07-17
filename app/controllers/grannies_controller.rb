class GranniesController < ApplicationController
  def index
    @grannies = Granny.all
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

  def edit
    authorize_owner!
  end

  def update
    authorize_owner!
    if @granny.update(granny_params)
      redirect_to granny_path(@granny), notice: "Granny updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize_owner!
    @granny.destroy
    redirect_to grannies_path, notice: "Granny unlisted."
  end

  private

  def set_granny
    @granny = Granny.find(params[:id])
  end

  def granny_params
    params.require(:granny).permit(:name, :bio, :price, :location, :available, :image)
  end
end
