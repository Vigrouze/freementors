class MentorsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @mentors = policy_scope(User).mentor
  end

  def show
    @mentor = User.find(params[:id])
    authorize @mentor
    @missions = Mission.all
  end
end
