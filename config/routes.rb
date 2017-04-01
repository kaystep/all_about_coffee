Rails.application.routes.draw do
  

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'
  
  #used to create all the RESTful actions on the users resource
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
