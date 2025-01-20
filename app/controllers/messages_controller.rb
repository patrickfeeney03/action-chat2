class MessagesController < ApplicationController
  def index
    if session[:name].nil?
      redirect_to names_path
    end
    @messages = ChatStore.instance.messages # instead of Message.all
    # @name = name_params
    # puts "The name is #{@name}"
  end

  def create
    puts "This is getting called"
    # @chat = Message.new(chat_params[:message])
    @message = Message.new(chat_params)
    @message.name = session[:name]["name"]
    # @chat.set_message(chat_params[:message])
    # @chat.set_name()
    ChatStore.instance.messages.push(@message) # instead of @chat.save
    @message.send_self

    render json: {}, status: :no_content
  end

  private

  def chat_params
    params.require(:message).permit(:text)
  end

  def name_params
    params.require(:name)
  end
end
