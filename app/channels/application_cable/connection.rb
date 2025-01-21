module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def connect

    end

    def subscribed
      puts "***** USER SUBSCRIBED **************"
      @user = find_user
      unless @user.nil?
        @user.set_online
      end
    end

    def disconnect
      @user = find_user
      if @user.nil?
        puts "@user in connection.rb was nil."
      else
        puts "Deleting session for #{@user.name}"
        @user.reset_session = true
        @user.set_offline
      end
    end

    private

    def find_user
      id = request.session[:id]

      unless ChatStore.instance.users.empty?
        ChatStore.instance.users.find { |curr_user| curr_user.id == id}
      end
    end
  end
end
