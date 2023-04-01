Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root "recipes#public_recipe_list"
  get 'shopping_list', to: 'shopping_list#index', as: 'shopping_list'

  resources :foods 
  delete 'food/:id', to: 'foods#destroy', as: 'delete_food'

  resources :recipes do
    resources :recipe_foods
  end
  # delete 'recipe/:recipe_id', to: 'recipes#destroy', as: 'delete_recipe'
  # get 'recipes', to: 'recipes#index', as: 'recipes'
  # get 'recipes/new', to: 'recipes#new', as: 'new_recipe'
  # post 'recipes/create', to: 'recipes#create', as: 'create_recipe'
  # get 'recipes/:recipe_id', to: 'recipes#show', as: 'recipe'
  # delete 'recipe/:recipe_id', to: 'recipes#destroy', as: 'delete_recipe'
  post 'recipes/:recipe_id/toggle_public', to: 'recipes#public_toggle_update', as: 'public_toggle'

end
