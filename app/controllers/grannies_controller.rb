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
    @granny = Granny.new(granny_params.except(:image))
    @granny.user = current_user

    # Handle Cloudinary upload
    if params[:granny][:image].present?
      begin
        upload_result = Cloudinary::Uploader.upload(
          params[:granny][:image].tempfile,
          folder: "development",
          resource_type: "auto"
        )

        @granny.image_key = upload_result['public_id']
      rescue => e
        Rails.logger.error "Cloudinary upload failed: #{e.message}"
        flash[:error] = "Image upload failed. Please try again."
        render :new and return
      end
    end

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

    # Handle Cloudinary upload if new image is provided
    if params[:granny][:image].present?
      begin
        upload_result = Cloudinary::Uploader.upload(
          params[:granny][:image].tempfile,
          folder: "development",
          resource_type: "auto"
        )

        # Update the image_key with new upload
        @granny.image_key = upload_result['public_id']
      rescue => e
        Rails.logger.error "Cloudinary upload failed: #{e.message}"
        flash[:error] = "Image upload failed. Please try again."
        render :edit and return
      end
    end

    if @granny.update(granny_params.except(:image))
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

    def api_index
    @grannies = Granny.all
    render json: @grannies.map { |granny| granny_json(granny) }
  end

  def api_show
    @granny = Granny.find(params[:id])
    render json: granny_json(@granny)
  end

  private

  def granny_json(granny)
      {
        id: granny.id,
        name: granny.name,
        bio: granny.bio,
        price: granny.price,
        location: granny.location,
        available: granny.available,
        image_key: granny.image_key,
        image_url: granny.image_url,
        owner_name: granny.owner_name,
        average_rating: granny.average_rating,
        latitude: granny.latitude,
        longitude: granny.longitude
      }
  end

  def set_granny
    @granny = Granny.find(params[:id])
  end

  def granny_params
    params.require(:granny).permit(:name, :bio, :price, :location, :available, :image)
  end
end
