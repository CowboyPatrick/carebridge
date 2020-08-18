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

  private

  def button_params
    params.require(:button).permit(:name, :photo)
  end
end
