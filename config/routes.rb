Rails.application.routes.draw do

  devise_for :users
  root to: 'posts#list_posts'

  resources :posts do
    member do
      put 'like', to: 'posts#upvote'
      put 'unlike', to: 'posts#downvote'
    end
  end
  get '/list_posts', to: 'posts#list_posts'
  get '/list_videos', to: 'posts#list_videos'
  # get '/articles', to: 'posts#index', param: :post
  # get '/videos', to: 'posts#index', param: :video
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :comments, only: %i[ create updade destroy ] do
    member do
      put 'like', to: 'comments#upvote'
      put 'unlike', to: 'comments#downvote'
    end
  end
end
