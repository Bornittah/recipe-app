Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :foods, only: [:index, :show, :new, :create, :destroy] 
  resources :users, only: [:index, :show]
end
