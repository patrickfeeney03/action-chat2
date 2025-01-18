class ChatStore
  include Singleton
  include ActiveModel::API

  attr_accessor :chats

  def initialize
    @chats = []
  end
end
