class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "general"
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
