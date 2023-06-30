Rails.application.routes.draw do
  resources :recipes, except: [:update] do
    resources :recipe_foods, except: [:index]
    patch 'toggle_public', on: :member
    delete 'recipe_foods/:id', to: 'recipe_foods#destroy', as: 'delete_recipe_food'
  end
  get "/public_recipes", to: "public_recipes#index"

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    unlock: 'unlock',
    sign_up: 'signup',
    edit: 'edit'
  }

  resources :foods, only: [:destroy, :index, :create, :new]

  resources :shopping_lists, only: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public_recipes#index"
end
