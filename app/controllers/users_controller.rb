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
    @button = Button.new
    @senior = User.find(params[:id])
    authorize current_user
  end

  def dashboard
    authorize current_user
    if current_user.has_seniors?
      @user = current_user.seniors.first
      redirect_to user_path(@user)
    else
      redirect_to new_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :photo )
  end
end
