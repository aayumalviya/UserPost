Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
    resources :post_comments, only: [:new , :create , :destroy]
  end 

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'


end  
