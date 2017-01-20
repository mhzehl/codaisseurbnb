Rails.application.routes.draw do
  resources :themes
  root to: 'pages#home'

  devise_for :users

  resources :users, only: [:show]
  resources :rooms
    resources :bookings, only: [:create]
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos
end
