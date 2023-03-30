Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "users#index"

  resources :foods 
  resources :users, only: [:index, :show]
  
  get 'recipes', to: 'recipes#index', as: 'recipes'
  get 'recipes/new', to: 'recipes#new', as: 'new_recipe'
  post 'recipes/create', to: 'recipes#create', as: 'create_recipe'
  get 'recipes/:recipe_id', to: 'recipes#show', as: 'recipe'
  delete 'recipe/:recipe_id', to: 'recipes#destroy', as: 'delete_recipe'
  
  delete 'food/:id', to: 'foods#destroy', as: 'delete_food'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "articles#index"

end
