class NotificationsController < ApplicationController
  def mark_as_seen
    @notification = Notification.find(params[:id])

    @notification.update(read: true)
    redirect_to home
  end

end
