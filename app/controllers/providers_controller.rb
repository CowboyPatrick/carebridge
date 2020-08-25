class ProvidersController < ApplicationController
  def show
    @provider_action = ProviderAction.new
    @provider = Provider.find(params[:id])
    authorize @provider
    case @provider.name.downcase!
    when 'amazon'
      render :groceries
    when 'facetime'
      render :facetime
    when 'taxi'
      render :taxi
    when 'emergency'
      render :emergency

      # when 'taxi'
      #   render 'shared/' # enterviewhere
      # when 'mealdelivery'
      #   render 'shared/' # enterviewhere
      # when 'videocall'
      #   render 'shared/' # enterviewhere
      # CHANGE THE ABOVE ACCORDING TO CATEGORIES
    end
  end

  private

  def groceries
  end
end
