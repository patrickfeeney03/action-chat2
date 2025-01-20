class NamesController < ApplicationController
  # Displays the initial page. With the form partial to enter any name.
  def index
  end

  def create
    @name = Name.new(name_params)

    user = User.new(name: @name, id: ChatStore.instance.user_count += 1)
    session[:name] = user.name
    session[:id] = user.id
    ChatStore.instance.users.push user
    redirect_to messages_path
  end

  private

  def name_params
    params.require(:name).permit(:name)
  end
end
