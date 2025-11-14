# config/routes.rb
Rails.application.routes.draw do
  get "surveys/new"
  get "surveys/create"
  get "surveys/show"
  
  root "pages#homepage"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/profile", to: "users#show"

  get "/admin/users", to: "admin#users", as: :admin_users

  resources :surveys, only: [:new, :create, :show]

end

