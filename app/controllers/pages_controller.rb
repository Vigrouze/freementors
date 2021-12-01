class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @missions = @user.missions_as_padawan
    @applied_missions = @user.applied_missions
    @mentors = @user.mentors
    @applied_mentors = @user.applied_mentors
  end

  def dashboard_mentors
    @user = current_user
    @missions = @user.missions_as_mentor
    @accepted_relationships = @user.relationships_as_mentor.where(status: :accepted)
    @other_relationships = @user.relationships_as_mentor.where.not(status: :accepted)
  end
end
