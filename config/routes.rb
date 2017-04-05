Rails.application.routes.draw do
  

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'

  #named get/post/delete routes for creating and destroying a user's sessions using cookies
  get '/login', to:  'sessions#new'

  post '/login', to:  'sessions#create'

  delete '/logout',  to: 'sessions#destroy'
  
  #used to create all the RESTful actions on the users resource
  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :microposts,          only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
