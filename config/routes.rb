Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/signup', to: 'users#new', as: 'signup'
  get '/users/:id', to: "users#show", as: "userinfo"

  resources :recipes  do
    resources :recipe_ingredients
    post '/recipe_ingredients/new', to: 'recipe_ingredients#create'
  end
 
  resources :ingredients
  
  post 'add_to_recipe', to: 'ingredients#add_to_recipe', as: 'add_to_recipe'
  root 'homepage#index'



end
