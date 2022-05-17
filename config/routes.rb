Rails.application.routes.draw do
  get 'home/index'
  get 'posts/index'
  root to: "home#index"  
  devise_for :users

  resources :users do
    resources :posts  
end 
  resources :posts do 
    resources :like_posts, only: [:create , :destroy]
  end 
  resources :posts do 
    resources :post_comments, only: [:create , :destroy]
  end 
end  
