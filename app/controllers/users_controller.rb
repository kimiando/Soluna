class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.update(status: 'online')
  end

  def edit
    @user = User.find(params[:id])
    @user.update(status: 'online')
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def user_params
    if params[:user][:password].present? || params[:user][:password_confirmation].present?
      params.require(:user).permit(:first_name, :last_name, :user_name, :nickname, :bio, :photo, :password, :password_confirmation)
    else
      params.require(:user).permit(:first_name, :last_name, :user_name, :nickname, :bio, :photo)
    end
  end
end
