class UsersController < ApplicationController

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    @user.caregiver = current_user
    authorize @user
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @senior = User.find(params[:id])
    authorize current_user
  end

  def dashboard
    @user = current_user.seniors.first
    authorize current_user
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :photo )
  end
end
