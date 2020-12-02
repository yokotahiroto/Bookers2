Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :users
  resources :books
  get "homes/about" =>"homes#about"
  resources :users, only: [:show, :edit, :update]
end