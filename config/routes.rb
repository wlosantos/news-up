Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :posts
  get '/articles', to: 'posts#index', param: :post
  get '/videos', to: 'posts#index', param: :video
  get 'tags/:tag', to: 'posts#index', as: :tag
end
