class UsersController < ApplicationController
  before_action :load_user, only: :show
  respond_to :html

  def index
  end

  def create
    respond_with(@user = User.create(user_params))
  end

  private
  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :latitude, :longitude)
  end
end
