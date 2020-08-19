class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path
    else
      render :show
    end
    authorize @order
  end

  def order_params
    params.require(:order).permit(order_items_attributes: {})
  end
end
