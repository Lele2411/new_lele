Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/index", to: "companies#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :users
end
