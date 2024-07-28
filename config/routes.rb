Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { 
    sign_in: 'signin', 
    sign_out: 'logout', 
    sign_up: 'signup' 
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  namespace :admin do
    resources :users
    resources :articles
    resources :comments
    root "dashboard#index"
  end
  
  resources :comments
  resources :articles do
    resources :comments, only: [:create]
  end

  root "home#index"
end
