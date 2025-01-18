class ChatsController < ApplicationController
  def index
    @chats = Chat.instance.chats # instead of Chat.all
  end

  def create
    @chat = Chat.build(chat_params)
    Chat.instance.chats.push(@chat) # instead of @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
