class MentorsController < ApplicationController
  def index
    @mentors = policy_scope(User).mentor
  end
end
