class Message
  include ActiveModel::API
  include Turbo::Broadcastable

  attr_accessor :user_id
  attr_accessor :text
  attr_accessor :created_at
  attr_accessor :name

  def initialize(attributes = nil)
    super
    @created_at = Time.new
  end

  def set_message(message)
    @text = message
  end

  def set_name(name)
    @name = name
  end
  def send_self
    broadcast_append_to(
      "messages",
      target: "messages",
      partial: "messages/message",
      local: { text: self, user_id: 1 }
    )
  end
end
