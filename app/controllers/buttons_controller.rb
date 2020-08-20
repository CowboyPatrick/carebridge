class ButtonsController < ApplicationController

  def index
    @buttons = policy_scope(Button)
  end

  def show
    @button = Button.find(params[:id])
    authorize @button
    @order = Order.new
    @order.order_items.build
  end

  def new
    @button = Button.new
    authorize @button
    @senior = User.find(params[:user_id])
  end

  def create
    @button = Button.new(button_params)
    @senior = User.find(params[:user_id])
    @button.user = @senior
    authorize @button
    if @button.save
      redirect_to @senior
    else
      render :new
    end
  end

  private

  def button_params
    params.require(:button).permit(:name, :photo, :provider_id, :user )
  end
end
