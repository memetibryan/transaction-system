Rails.application.routes.draw do

	root :to => 'index#index'

  
  devise_for :users do
  	resources :profiles
  	resources :transactions
    resources :mpesas
  end

  resources :profiles do
    resources :users
  end

  resources :transactions do
    resources :users
  end

  resources :mpesas do
    resource :users
  end
  
end
