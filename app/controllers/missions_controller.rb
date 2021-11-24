class MissionsController < ApplicationController
  def index
    @missions = policy_scope(Mission).order(start_date: :desc)
  end

  def show
    @mission = Mission.find(params[:id])
    authorize @mission
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(missions_params)
    @mission.mentor = current_user
    # To test
    @mission.duration = @mission.calculated_duration
    authorize @mission

    if @mission.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def missions_params
    params.require(:mission).permit(:name, :company, :start_date, :end_date, :description, :fee, :remote, :mentor_id)
  end
end
