Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get "home/about" => "home/about"
  resources :users do
   member do
     get :following, :follower 
    end
  end
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
end