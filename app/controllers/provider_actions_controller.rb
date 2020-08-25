class ProviderActionsController < ApplicationController

  def create
    @provider_action = ProviderAction.new(provider_action_params)
    @senior = User.find(params[:user_id])
    @provider_action.user = @senior
    authorize @provider_action
    @provider = @provider_action.provider
    if @provider_action.save
      redirect_to new_user_provider_action_path(@senior, provider: @provider_action.provider)
    else
      render :new
    end
  end

  def new
    @senior = User.find(params[:user_id])
    @provider_action = ProviderAction.new
    @provider_action.user = @senior
    authorize @provider_action
    @provider = Provider.find(params[:provider]) if params[:provider]
  end

  def grocery_search
    @senior = User.find(params[:user_id])
    @provider_action = ProviderAction.new
    @provider_action.user = @senior
    skip_authorization
    @provider = Provider.find_by(name: 'groceries')
    @products = Kroger::ProductSearch.call(params[:query])
    render :new
  end

  private

  def provider_action_params
    params.require(:provider_action).permit(:name, :photo, :provider_id)
  end

end
