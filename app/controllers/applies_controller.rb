class AppliesController < ApplicationController

  def new
    @apply = Apply.new
    @mission = Mission.find(params[:mission_id])
    authorize @apply
  end

  def create
    @apply = Apply.new(apply_params)
    authorize @apply

    @mission = Mission.find(params[:mission_id])
    @apply.mission = @mission
    @apply.padawan = current_user

    if @apply.valid?
      @apply.save

      chatroom = Chatroom.find_by(mentor_id: @mission.mentor.id, padawan_id: current_user.id)
      redirect_to chatroom_path(chatroom, icon: 'success'), notice: "Application sent"
    else
      redirect_to mentor_path(@mission.mentor, icon: 'info'), notice: "There was an issue"
    end
  end

  def approve
    @application = Apply.find(params[:id])
    authorize @application
    @application.update(status: :accepted)
    redirect_to dashboard_mentors_path
  end

  def decline
    @application = Apply.find(params[:id])
    authorize @application
    @application.update(status: :denied)
    redirect_to dashboard_mentors_path
  end

  private

  def apply_params
    params.require(:apply).permit(:motivation, :mission_id)
  end
end
