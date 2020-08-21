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
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @senior = User.find(params[:id])
    @orders = Order.where
    authorize current_user
  end

  def dashboard
    authorize current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :photo )
  end
end
