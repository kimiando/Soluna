class UsersController < ApplicationController
  def index
    @users = User.all
    @users_with_friends = @users.includes(:invitations).map do |user|
      { user: user, friends: user.friends }
    end
  end

  def show
    @user = User.find(params[:id])
    @user.update(status: 'online')
    @other_user = User.find(params[:other_user_id]) if params[:other_user_id].present?
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

  def send_invitation
    friend = User.find(params[:id])

    if current_user.send_invitation(friend)
      redirect_to user_path(friend), notice: 'Friend invitation sent!'
    else
      redirect_to user_path(friend), alert: 'Unable to send friend invitation.'
    end
  end

  def cancel_friend_request
    friend = User.find(params[:id])

    if current_user.cancel_friend_request(friend)
      redirect_to user_path(friend), notice: 'Friend request canceled.'
    else
      redirect_to user_path(friend), alert: 'Unable to cancel friend request.'
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
