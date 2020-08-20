class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def create
    @order = Order.new(order_params)

    authorize @order
    if @order.save
      LinebotJob.perform_now(@order) #TODO: CHANGE TO LATER AFTER ADDING SIDEKICK
      redirect_to orders_path
    else
      render :show
    end

  end

  def order_params
    params.require(:order).permit(order_items_attributes: {})
  end
end
