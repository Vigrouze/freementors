class MentorsController < ApplicationController
 skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @mentors = policy_scope(User).mentor
  end
end
