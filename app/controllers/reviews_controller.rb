class ReviewsController < ApplicationController

  def create
    @review = Review.new(params_review)
    @review.reviewer = current_user
    @review.mission_id = params[:mission_id]
    mentor = Mission.find(params[:mission_id]).mentor_id
    @review.mentor = mentor
    @review.save
    redirect_to dashboard_path
  end

  def update
    @review = Review.find(params_review)
    @review.save
    redirect_to dashboard_path
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
