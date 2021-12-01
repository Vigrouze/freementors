class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(current_user.chatrooms).order(updated_at: :desc)
  end

  def create
    @chatroom = Chatroom.new
    authorize @chatroom

    @mentor = User.find(params[:mentor_id])

    @chatroom.mentor = @mentor
    @chatroom.padawan = current_user

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'mentors/show'
    end
  end

  def show
    @chatrooms = policy_scope(current_user.chatrooms).order(updated_at: :desc)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
