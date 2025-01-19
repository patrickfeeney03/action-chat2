class ChatsController < ApplicationController
  def index
    if session[:name].nil?
      redirect_to names_path
    end
    @chats = ChatStore.instance.chats # instead of Chat.all
    # @name = name_params
    # puts "The name is #{@name}"
  end

  def create
    puts "This is getting called"
    # @chat = Chat.new(chat_params[:message])
    @chat = Chat.new(chat_params)
    @chat.name = session[:name]["name"]
    # @chat.set_message(chat_params[:message])
    # @chat.set_name()
    ChatStore.instance.chats.push(@chat) # instead of @chat.save
    @chat.send_self

    render json: {}, status: :no_content
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end

  def name_params
    params.require(:name)
  end
end
