class ButtonsController < ApplicationController
  def index
    @buttons = policy_scope(Button)
  end

  def show
    @button = Button.find(params[:id])
    authorize @button
  end

  private

  def button_params
    params.require(:button).permit(:name, :photo)
  end
end
