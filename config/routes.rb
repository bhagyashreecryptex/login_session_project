Rails.application.routes.draw do
  get 'session/new', to: 'session#new', as: 'new_session'
  post 'session/create', to: 'session#create', as: 'session_create'
  delete '/logout', to: 'session#destroy', as: 'destroy_session'
  get '/session', to: 'session#show', as: 'session'

  # get 'users/index'
  # get 'users/new'
  # post 'users/create'
  # get 'users/show'
  patch 'users/edit', to: 'users#edit', as: 'edit_users'
 

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root"users#new"
end




