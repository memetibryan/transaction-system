Rails.application.routes.draw do

	root :to => 'index#index'

  devise_for :users do
  	resources :profiles
  end

  resources :profiles do
    resources :users
  end

  resources :profiles
  resources :transactions
  
end
