class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.update_column(:status, 'online')
  end

  def edit
    @user = User.find(params[:id])
    @user.update_column(:status, 'online')
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :nickname, :bio, :photo)
  end
end
