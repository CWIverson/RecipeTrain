Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/signup', to: 'users#new', as: 'signup'
  get '/users/:id', to: "users#show", as: "userinfo"

  resources :recipes
  get '/index', to: "recipes#index", as: 'recipe_index'
  get '/new', to: 'recipes#new', as: 'recipe_new'

  resources :ingredients
  get 'index', to: 'ingredients#index', as: 'ingredient_index'
  get 'new', to: 'ingredients#new', as: 'ingredient_new'

  post 'add_to_recipe', to: 'ingredients#add_to_recipe', as: 'add_to_recipe'
  root 'homepage#index'



end
