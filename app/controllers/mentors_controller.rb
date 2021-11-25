class MentorsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index ]

  def index

    if params[:tags].present?
      @mentors = policy_scope(User).mentor.tagged_with(params[:tags])
    else
      @mentors = policy_scope(User).mentor
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/mentors.html', locals: { mentors: @mentors } }
    end

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
