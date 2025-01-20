class ChatChannel < ApplicationCable::Channel
  def subscribed
  end

  def unsubscribed
    puts "UNSUBSCRIBED 2"
  end
end
