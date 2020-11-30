Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :users
  resources :books
  resources :users, :only => [:show]
end