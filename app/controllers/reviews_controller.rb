class ReviewsController < ApplicationController
  before_action :set_accommodation, only: %i[new create]
  def new
    @accommodation = Accommodation.find(params[:accommodation_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.accommodation = @accommodation
    if @review.save
      redirect_to accommodation_path(@accommodation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to accommodation_path(@review.accommodation), status: :see_other
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:accommodation_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
