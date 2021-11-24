class MentorsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index ]

 @skills = ["ruby", "javascript", "CSS", "PHP", "python"]

  def index
    @mentors = policy_scope(User).mentor
  end

  def show
    @mentor = User.find(params[:id])
    authorize @mentor
    @missions = @mentor.missions_as_mentor
  end

  def tagged
    if params[:tag].present?
      @mentors = policy_scope(User).mentor.tagged_with(params[:tag])
    else
      @mentors = policy_scope(User).mentor
    end
  end
end
