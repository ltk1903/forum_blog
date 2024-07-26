Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :articles
    resources :comments
    root "dashboard#index"
  end
  
  resources :comments
  resources :articles
  get "signup", to: "registration#new"
  post "signup", to: "registration#create"
  
  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  root "home#index"

  resources :users, only: [:new, :create]
  resources :articles do
    resources :comments, only: [:create]
  end
end
