Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'users/new'
  # get 'user/new'
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "posts#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "signup" => "users#new"
  # get "users/index" => "users#index"
  # get "users/:id" => "users#show"
  # post "users/create" => "users#create"
  post "signup" => "users#create"

  resources :users

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  # Defines the root path route ("/")
  # root "posts#index"

end
