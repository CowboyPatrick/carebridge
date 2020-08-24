Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :buttons, only:[:index, :show]
  resources :providers, only:[:show] do
    resources :provider_actions, only:[:create]
  end
  resources :orders, only:[:index, :create]
  resources :users, only:[:new, :create, :show] do
    resources :buttons, only:[:new, :create]
  end
  get '/dashboard', to: 'users#dashboard'
  post '/seniors', to: 'users#create'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/callback', to: 'linebots#get_id'
      post '/emergency', to: 'linebots#emergency'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
