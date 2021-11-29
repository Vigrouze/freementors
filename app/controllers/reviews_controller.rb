class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @review.save
    authorize @review
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.update(params_review)
    @review.save
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating, :reviewer_id, :reviewee_id, :mission_id)
  end
end
