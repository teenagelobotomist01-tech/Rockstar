Rails.application.routes.draw do
  resources :surveys, only: [:new, :create]

  scope "(:locale)", locale: /en|es/ do
    root "pages#homepage"

    resources :users, only: [:new, :create, :show]
    resources :sessions, only: [:new, :create, :destroy]
  end
end

