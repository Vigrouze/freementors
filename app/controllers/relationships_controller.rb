class RelationshipsController < ApplicationController
  include ApplicationHelper

  def create
    @mentor = User.find(params[:mentor_id])
    @relationship = Relationship.new
    @relationship.padawan = current_user
    @relationship.mentor = @mentor
    authorize @relationship
    @missions = @mentor.missions_as_mentor
    if @relationship.save
      redirect_to mentor_path(@mentor), notice: 'Relation request sent!'
    else
      redirect_to mentor_path(@mentor), alert: 'You already sent a request, be patient'
    end
  end

  def update
    @relationship = Relationship.find(params[:id])
    @relationship.status = 1
    @relationship.save
    authorize @relationship
    redirect_to mentor_path(@relationship.mentor)
  end
end
