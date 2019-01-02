Rails.application.routes.draw do
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  delete "/signout", to: "sessions#destroy"

  post "/rides/new", to: "rides#new"

  resources :attractions
  resources :users, only: [:new, :create, :show, :edit]


  root "welcome#home"


end
