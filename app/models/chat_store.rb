class ChatStore
  include Singleton
  include ActiveModel::API

  attr_accessor :messages
  attr_accessor :message_count
  attr_accessor :users
  attr_accessor :user_count

  def initialize
    @messages = []
    @message_count = 0
    @users = []
    @user_count = 0
  end
end
