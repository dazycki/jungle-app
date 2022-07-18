Rails.application.routes.draw do

  namespace :admin do
    get 'categories/index'
  end
  
  get 'about/index'
  root to: 'products#index'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  # these routes are for showing users a signup form, and to create a new user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :about, only: [:index]  

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

end
