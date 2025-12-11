Rails.application.routes.draw do
  scope "(:locale)", locale: /en|es/ do
    root "pages#homepage"

    resources :users, only: [:new, :create, :show, :index] do
      resources :surveys, only: [:new, :create, :show]
    end

    resources :sessions, only: [:new, :create, :destroy]

    get 'planner/dashboard', to: 'planners#dashboard', as: :planner_dashboard

    delete "logout", to: "sessions#destroy", as: :logout
  end
end

