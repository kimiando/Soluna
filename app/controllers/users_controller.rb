class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def create
  #   @user = User.find(params[:id])
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :bio)
  end
end
