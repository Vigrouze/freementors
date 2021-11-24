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
      flash[:notice] = 'Relation request sent!'
      redirect_to mentor_path(@mentor)
    else
      render 'mentors/show'
    end
  end
end
