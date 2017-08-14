class UsersController < ApplicationController
  def index
  end

  def create

  end

  private
  def user_params
    params.require(:user).permit(:name, :latitude, :longitude)
  end
end
