Rails.application.routes.draw do

  get 'users/index'

  get 'users/new'

	root :to => 'index#index'

  devise_for :users do
  	resources :profiles
  	resources :transactions
  end

  resources :profiles do
    resources :users
  end

  resources :transactions do
    resources :users
  end

  resources :mpesa
  
end
