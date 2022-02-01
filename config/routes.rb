Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
