class ChatsController < ApplicationController
  def index
    @chats = ChatStore.instance.chats # instead of Chat.all
  end

  def create
    puts "This is getting called"
    # @chat = Chat.new(chat_params[:message])
    @chat = Chat.new
    @chat.set_message(chat_params[:message])
    ChatStore.instance.chats.push(@chat) # instead of @chat.save
    @chat.send_self

    render json: {}, status: :no_content
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
