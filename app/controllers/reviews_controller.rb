class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.granny = @granny
    if @review.save
      redirect_to granny_path(@granny)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to granny_path(@review.granny), status: :see_other
  end

  private

  def set_granny
    @granny = Granny.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
