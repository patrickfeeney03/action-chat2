class Chat
  include ActiveModel::API
  include Turbo::Broadcastable

  attr_accessor :message
  attr_accessor :created_at

  def initialize
    @created_at = Time.new
  end

  def set_message(message)
    @message = message
  end
  def send_self
    broadcast_append_to(
      "chats",
      target: "chats",
      partial: "chats/chat",
      local: { chat: self }
    )
  end
end
