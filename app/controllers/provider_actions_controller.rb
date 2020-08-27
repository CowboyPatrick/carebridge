class ProviderActionsController < ApplicationController

  def create
    @provider_action = ProviderAction.new(provider_action_params)
    @senior = User.find(params[:user_id])
    @provider_action.user = @senior
    authorize @provider_action
    @small_photo_url = params[:provider_action][:additional_info][:photo_url]
    attach_url_photo(@provider_action, @small_photo_url) if @small_photo_url.present?
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

  def update
    @provider_action = ProviderAction.find(params[:id])
    @provider_action.update(provider_action_params)
    authorize @provider_action
    redirect_to new_user_provider_action_path(@provider_action.user)
  end

  def grocery_search
    @senior = User.find(params[:user_id])
    @provider_action = ProviderAction.new
    @provider_action.user = @senior
    skip_authorization
    @provider = Provider.find_by(name: 'Groceries')
    @products = Kroger::ProductSearch.call(params[:query])
    render :new
  end

  private

  def provider_action_params
    params.require(:provider_action).permit(:name, :photo, :provider_id, :price, :enabled, :facetime_id)
  end

  def attach_url_photo(proaction, photo)
    file = URI.open(photo)
    filename = proaction.name.gsub(/\W/, "")
    proaction.photo.attach(io: file, filename: "#{filename}.jpg", content_type: 'image/jpg')
  end

end
