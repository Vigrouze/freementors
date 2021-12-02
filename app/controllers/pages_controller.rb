class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @missions = @user.missions_as_padawan
    @applied_missions = @user.applied_missions
    @application_requests = @user.application_requests
    @mentors = @user.mentors
    @padawans = @user.relationships_as_mentor.map{|relationship| User.find(relationship.padawan_id)}
    @applied_mentors = @user.applied_mentors
  end

  def dashboard_mentors
    @user = current_user
    @missions = @user.missions_as_mentor
    @accepted_relationships = @user.relationships_as_mentor.where(status: :accepted)
    @pending_relationships = @user.relationships_as_mentor.where(status: :pending)
    @denied_relationships = @user.relationships_as_mentor.where(status: :denied)
  end
end
