class User
  include ActiveModel::API
  include Turbo::Broadcastable

  attr_accessor :name
  attr_accessor :message_ids
  attr_accessor :id
  attr_accessor :reset_session

  def initialize(attributes = nil)
    super
    @message_ids = []
  end

  def set_status
    message = Message.new(text: "abc", name: "pat", created_at: Time.now, user_id: 2)
    broadcast_append_to(
      "messages",
      target: "messages",
      partial: "messages/message",
      locals: { message: message, user_id: 2 }
    )
  end
end
