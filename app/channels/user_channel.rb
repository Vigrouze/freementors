class UserChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    user = User.find(current_user.id)
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
