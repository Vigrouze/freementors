class MentorsController < ApplicationController
  def index
    @mentors = User.mentor
  end
end
