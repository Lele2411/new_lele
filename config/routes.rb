Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/login", to: "sessions#new"
  get "/", to: "sessions#index"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :companies
  post '/select-pagination', to: "pagination#create"
end
