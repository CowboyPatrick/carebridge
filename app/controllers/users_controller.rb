class UsersController < ApplicationController

  def new
    @user = User.new
    authorize @user
  end

  def create

  end

  def dashboard
    authorize current_user
  end
end
