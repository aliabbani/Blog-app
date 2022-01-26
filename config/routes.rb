Rails.application.routes.draw do
  root "users#index"

  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
