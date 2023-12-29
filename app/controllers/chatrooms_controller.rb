class ChatroomsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    @chatrooms = Chatroom.all
    # @user_counts = @chatrooms.map(&:user_count)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = current_user.chatrooms.build(chatroom_params)
    @message = Message.new

    if @chatroom.save
      flash[:notice] = "Chatroom was successfully created."
      redirect_to @chatroom
    else
      render :new
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.messages.destroy_all
    @chatroom.destroy
    redirect_to chatrooms_path
  end

  def user_count
    users.count
  end
  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :photo)
  end
end
