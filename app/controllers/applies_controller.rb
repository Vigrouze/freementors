class AppliesController < ApplicationController
  before_action :set_mission, only: [ :show, :edit, :update, :destroy ]


  def index
  end

  def show
    @mission = Mission.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end



  def pending
    @mission = Mission.find(params[:id])
    @mission.status = "pending"
    mission.save

    authorize @mission
    redirect_to mentor_profil_path

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

  def mission_params
    params.require(:mission).permit(:start_date, :end_date, :mission_id)
  end
end
