Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :buttons, only:[:index, :show]
  resources :orders, only:[:index, :create]
  resources :users, only:[:new, :create, :show] do
    resources :buttons, only:[:new, :create]
  end
  get '/dashboard', to: 'users#dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
