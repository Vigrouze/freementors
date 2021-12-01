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
    @applied_mentors = @user.applied_mentors
  end
end
