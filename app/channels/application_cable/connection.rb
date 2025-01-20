module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def connect

    end

    def disconnect
      puts "USER HAS DISCONNECTED"
    end
  end
end
