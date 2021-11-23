class AppliesController < ApplicationController

  def create
    @apply = Apply.new(applies_params)
  end

  def update
  end

  def approve
    @mission = Mission.find(params[:id])
    @mission.status = "accepted"
    @mission.save

    authorize @mission
    redirect_to mentor_profil_path
  end

  def deny
    @mission = Mission.find(params[:id])
    @mission.status = "denied"
    @mission.save

    authorize @mission
    redirect_to mentor_profil_path
  end

  private

  def apply_params
    params.require(:apply).permit(:status, :motivation, :mission_id, :padawan_id)
  end
end
