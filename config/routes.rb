Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :posts
  get '/list_posts', to: 'posts#list_posts'
  get '/list_videos', to: 'posts#list_videos'
  # get '/articles', to: 'posts#index', param: :post
  # get '/videos', to: 'posts#index', param: :video
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :comments, only: %i[ create updade destroy ]
end
