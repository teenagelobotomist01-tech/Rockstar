Rails.application.routes.draw do
resources :users do
  resources :surveys, only: [:new, :create, :show]
end
  scope "(:locale)", locale: /en|es/ do
    root "pages#homepage"

    # ahora incluye index para que el admin pueda ver la lista
    resources :users, only: [:new, :create, :show, :index]
    resources :sessions, only: [:new, :create, :destroy]

  delete "logout", to: "sessions#destroy", as: :logout
  end
end

