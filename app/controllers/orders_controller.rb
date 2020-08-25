class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    authorize @order
    if @order.save
      LinebotJob.perform_now(@order) #TODO: CHANGE TO LATER AFTER ADDING SIDEKICK
      redirect_to order_path(@order)
    else
      @button = Button.find(params[:button_id])
      render 'buttons/show'
    end
  end

  def order_params
    params.require(:order).permit(order_items_attributes: {})
  end
end
