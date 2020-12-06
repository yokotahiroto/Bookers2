Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  resources :books
  resources :users
  get "home/about" => "home/about"
end