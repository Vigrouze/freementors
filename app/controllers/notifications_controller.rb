class NotificationsController < ApplicationController
  def mark_as_seen
    @notification = Notification.find(params[:id])
    authorize @notification

    @notification.update(read: true)
    redirect_to @notification.on_click_url
  end

end
