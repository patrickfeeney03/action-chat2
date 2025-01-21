class MessagesController < ApplicationController
  def index
    nil_session?
    not_in_list_but_in_session?

    user = ChatStore.instance.users.find { |curr_user| curr_user.id == session[:id] }
    unless user.nil?
      user.set_online
    end

    @messages = ChatStore.instance.messages # instead of Message.all
  end

  def create
    puts "This is getting called"
    @message = Message.new(chat_params)
    @message.name = session[:name]["name"]
    ChatStore.instance.messages.push(@message) # instead of @chat.save
    @message.send_self

    render json: {}, status: :no_content
  end

  private

  def not_in_list_but_in_session?
    user_session = session[:id]
    user_store = ChatStore.instance.users.find { |curr_user| curr_user.id == session[:id] }
    if !user_session.nil? && user_store.nil?
      reset_session
      redirect_to names_path
    elsif !user_store.nil?
      reset_session?
    end
  end

  def nil_session?
    if session[:id].nil?
      redirect_to names_path
    end
  end

  def reset_session?
    user = ChatStore.instance.users.find { |curr_user| curr_user.id == session[:id] }
    if user.reset_session == true
      user.reset_session = false
      reset_session
      redirect_to names_path
    end
  end
  def chat_params
    params.require(:message).permit(:text)
  end

  def name_params
    params.require(:name)
  end
end
