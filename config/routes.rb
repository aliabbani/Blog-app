Rails.application.routes.draw do
  root "users#index"
  # post 'posts', to: 'posts#create' # create
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts do
    resources :comments, only: [create]
    resources :likes, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
