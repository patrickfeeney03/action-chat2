class User
  include ActiveModel::API

  attr_accessor :name
  attr_accessor :message_ids
  attr_accessor :id

  def initialize(attributes = nil)
    super
    @message_ids = []
  end
end
