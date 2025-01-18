class Chat
  include ActiveModel::API
  attr_accessor :message
  attr_accessor :created_at

  def initialize(message)
    @message = message
    @created_at = Time.new
    # broadcast_chat
  end

  # def broadcast_chat
  #   broadcast_append_to(
  #     "chats",
  #     target: "chats",
  #     partial: "chats/chat",
  #     locals: { chat: self }
  #   )
  # end
end
