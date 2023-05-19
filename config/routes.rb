# require "app/models/users"
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'users#index'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, controller: 'users/posts' do
      resources :comments, only: [:new, :create, :destroy], controller: 'users/posts/comments'
      resources :likes, only: [:create], controller: 'users/posts/likes'
    end
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v0 do
      resources :users, only: :show do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create]
        end
      end
   end
end
end
