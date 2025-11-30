Rails.application.routes.draw do
    root "pages#homepage"
    
    resources :users, only: [:new, :create, :show]
    resources :sessions, only: [:new, :create, :destroy]
end
