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
      locals: { message: self }
    )
  end

  def set_offline
    # The problem with this, I think, is that the WS probably takes a while to disconnect, so the page refreshes before the WS disconnects and the user gets removed after being added? Idk.
    puts "**** Removing User from ChatStore"
    puts "**** Broadcast remove from WS"
    ChatStore.instance.users.delete_if { |user| user.id == self.id }
    broadcast_remove_to(
      "users",
    target: self # The target can't be "users" because that would delete the main target itself lol.
    )
  end
end
