Rails.application.routes.draw do
  root "pages#index"

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:id", to: "posts#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
