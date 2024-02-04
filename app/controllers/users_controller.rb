class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user.update_column(:status, 'online')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: 'User was successfully created.'
    else
      flash.now[:alert] = 'Error creating user. Please check the form for errors.'
      render :new
    end
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
    params.require(:user).permit(:first_name, :last_name, :user_name, :bio, :photo, :nickname, :email, :password, :password_confirmation)
  end

end
