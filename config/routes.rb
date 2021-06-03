Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/signup', to: 'users#new', as: 'signup'


  resources :recipes
  get '/index', to: "recipes#index", as: 'index'
  get '/new', to: 'recipes#new', as: 'new'


  root 'homepage#index'



end
