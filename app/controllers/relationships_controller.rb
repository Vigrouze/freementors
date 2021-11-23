class RelationshipsController < ApplicationController
  include ApplicationHelper

  def create
    return if current_user.id == params[:mentor_id]
    return if relation_request_sent?(User.find(params[:mentor_id]))

    @user = User.find(params[:mentor_id])
    @relationship = current_user.relation_sent.build(mentor_id: params[:mentor_id])
      if @relationship.save
        flash[:sucess] = 'Relation request sent!'
      else
        flash[:danger] = 'Relation request failed!'
      end
      redirect_back(fallback_location: root_path)
  end

  def accept_relation
    @relationship = Relationship.find_by(padawan_id: params[:padawan_id])
  end

end
