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

    if @apply.save
      redirect_to mentor_path(@mission.mentor, icon: 'success'), notice: "Application sent"
    else
      render :new
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

  def update
  end

  # def approve
  #   @mission = Mission.find(params[:id])
  #   @mission.status = "accepted"
  #   @mission.save!

  #   authorize @mission
  #   redirect_to mentor_profil_path
  # end

  # def deny
  #   @mission = Mission.find(params[:id])
  #   @mission.status = "denied"
  #   @mission.save!

  #   authorize @mission
  #   redirect_to mentor_profil_path
  # end

  private

  def apply_params
    params.require(:apply).permit(:motivation)
  end
end
