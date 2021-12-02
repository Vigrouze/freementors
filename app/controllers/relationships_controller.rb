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
      redirect_to mentor_path(@mentor, icon: 'success'), notice: 'Relation request sent'
    else
      redirect_to mentor_path(@mentor, icon: 'info'), alert: 'You already sent a request, be patient'
    end
  end

  def approve
    @relationship = Relationship.find(params[:id])
    authorize @relationship
    @relationship.update(status: :accepted)
    redirect_to dashboard_mentors_path
  end

  def decline
    @relationship = Relationship.find(params[:id])
    authorize @relationship
    @relationship.update(status: :denied)
    redirect_to dashboard_mentors_path
  end
end
