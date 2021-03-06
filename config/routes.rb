Rails.application.routes.draw do
  devise_for :users

  root 'home#home'
  get 'home/about'

  resources :users

  resources :posts do
    resource :post_comments, only: [:create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
