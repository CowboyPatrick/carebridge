Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  root to: 'pages#home'
  resources :buttons, only:[:index, :show]
  resources :providers, only:[:show] do
  end
  resources :orders, only:[:index, :show, :create]
  resources :users, only:[:new, :create, :show] do
    resources :provider_actions, only:[:new, :create, :update]
    get '/grocery_search', to: 'provider_actions#grocery_search', as: :grocery_search
    resources :buttons, only:[:new, :create]
  end
  get '/dashboard', to: 'users#dashboard'
  post '/seniors', to: 'users#create'
  post '/callback', to: 'api/v1/linebots#get_id'


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/emergency', to: 'linebots#emergency'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
