class MentorsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @mentors = policy_scope(User).mentor
    if params[:search] && params[:search][:query].present?
      @mentors = @mentors.search_by_last_name_and_skills(params[:search][:query])

    elsif params[:tags].present?
      @mentors = @mentors.tagged_with(params[:tags])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/mentors.html', locals: { mentors: @mentors } }
    end
  end

  def show
    @mentor = User.find(params[:id])
    authorize @mentor
    @missions = @mentor.missions_as_mentor.where(padawan_id: nil).order(status: :asc)
  end

  def tagged
    if params[:tag].present?
      @mentors = policy_scope(User).mentor.tagged_with(params[:tag])
    else
      @mentors = policy_scope(User).mentor
    end
  end
end
