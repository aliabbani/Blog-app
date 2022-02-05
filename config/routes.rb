Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # root "users#index"
  delete 'comment/:id', to: 'comments#destroy', as: 'destroy_comment'
  resources :users do
    resources :posts
  end
  resources :posts do
    resources :comments, only: [:new, :create, :show]
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
