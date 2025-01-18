class ChatsController < ApplicationController
  def index
    @chats = ChatStore.instance.chats # instead of Chat.all
  end

  def create
    # @chat = ChatStore.build(chat_params)
    @chat = Chat.new(chat_params[:message])
    ChatStore.instance.chats.push(@chat) # instead of @chat.save
    # ActionCable.server.broadcast("chats_channel", @chat)

    render json: {}, status: :no_content
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
