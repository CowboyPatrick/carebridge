class ProviderActionsController < ApplicationController
  def create
    @provider_action = ProviderAction.new(provider_action_params)
    @provider = Provider.find(params[:provider_id])
    @provider_action.user = current_user
    @provider_action.provider = @provider
    authorize @provider_action
    if @provider_action.save
      redirect_to provider_path(@provider)
    else
      redirect_to provider_path(@provider)
    end
  end

  private

  def provider_action_params
    params.require(:provider_action).permit(:name, :photo)
  end
end
