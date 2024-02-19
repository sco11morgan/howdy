Rails.application.routes.draw do
  resources :standups, only: [:new, :create, :index, :show]
  resources :user_teams
  get "admin/connections", to: "admin#connections"
  get "admin/setup"
  resources :teams
    resources :posts
  resources :questions
  resources :users
  resources :user_teams
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :sessions, only: [:new, :create, :destroy]
  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout
  # delete "/log_out", to: "sessions#destroy", as: :log_out

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "posts#index"
end
