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

  def set_online
    broadcast_append_to(
      "users",
      target: "users",
      partial: "users/user",
      locals: { message: self, user_id: self.id }
    )
  end

  def set_offline
    broadcast_remove_to(
      "users",
    target: self
    )
  end
end
