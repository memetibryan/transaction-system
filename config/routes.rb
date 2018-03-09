Rails.application.routes.draw do

  devise_for :users
  root :to => 'index#index'

  resources :profiles
  resources :transaction
  
end
