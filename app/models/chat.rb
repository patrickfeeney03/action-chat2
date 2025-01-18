class Chat
  include ActiveModel::API
  include Turbo::Broadcastable

  attr_accessor :message
  attr_accessor :created_at

  def initialize(message)
    @message = message
    @created_at = Time.new
    broadcast_append_to(
      "chats",
      target: "chats",
      partial: "chats/chat",
      local: { chat: self }
    )
  end
end
