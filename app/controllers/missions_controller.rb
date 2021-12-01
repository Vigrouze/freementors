class MissionsController < ApplicationController
  # def index
  #   @missions = policy_scope(Mission).
  # end

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

  def finished
    @mission = Mission.find(params[:id])
    authorize @mission
    @mission.status = 2
    @mission.padawan = current_user
    current_user.xp_level += 5
    if current_user.xp_level >= 25
      current_user.xp_status = "Padawan Confirmé"
    else
      current_user.xp_status = "Padawan"
    end
    current_user.save
    @mission.save
    redirect_to dashboard_path
  end

  def update
  end

  def edit
  end

  def delete
  end

  private

  def missions_params
    params.require(:mission).permit(:name, :company, :start_date, :end_date, :description, :fee, :remote, :mentor_id, tag_list: [] )
  end
end
