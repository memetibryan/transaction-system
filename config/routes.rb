Rails.application.routes.draw do

	root :to => 'index#index'

  get 'users', :to => '/', :as => :user_root

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
