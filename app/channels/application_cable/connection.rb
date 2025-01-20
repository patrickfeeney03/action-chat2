module ApplicationCable
  class Connection < ActionCable::Connection::Base

    def connect
      # puts "********* #{request.session[:id]}"
      # user = find_user
      @user = find_user
      # puts "The ID of the user making the request is #{user.id}"
    end

    def disconnect
      if @user.nil?
        puts "@user in connection.rb was nil."
      else
        puts "Deleting session for #{@user.name}"
        @user.reset_session = true
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
