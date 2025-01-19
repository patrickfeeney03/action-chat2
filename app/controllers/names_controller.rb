class NamesController < ApplicationController
  # Displays the initial page. With the form partial to enter any name.
  def index
  end

  def create
    @name = Name.new(name_params)
    session[:name] = @name
    redirect_to chats_path
  end

  private

  def name_params
    params.require(:name).permit(:name)
  end
end
