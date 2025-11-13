# config/routes.rb
Rails.application.routes.draw do
  
  root "pages#homepage"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/profile", to: "users#show"

  get "/admin/users", to: "admin#users", as: :admin_users
end

