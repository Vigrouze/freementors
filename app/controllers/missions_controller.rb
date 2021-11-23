class MissionsController < ApplicationController
  def index
    @missions = Mission.all
    @missions = policy_scope(Mission).order(created_at: :desc)
  end

  def show
    @mission = Mission.find(params_id)
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(missions_params)
    @mission.mentor = current_user
    @mission.duration = (@mission.end_date - @mission.start_date)
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
