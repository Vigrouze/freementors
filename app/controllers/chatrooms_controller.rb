class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(current_user.chatrooms).order(updated_at: :desc)
  end

  def create
    @chatroom = Chatroom.new
    @user = User.find(params[:id])
  end

  def show
    @chatrooms = policy_scope(current_user.chatrooms).order(updated_at: :desc)

    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
