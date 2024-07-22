Rails.application.routes.draw do
  resources :comments
  resources :articles
  get "signup", to: "registration#new"
  post "signup", to: "registration#create"
  
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  root "home#index"

  resources :articles do
    resources :comments, only: [:create]
  end
end
