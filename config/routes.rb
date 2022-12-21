Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'homes#top'

  get "home/about" => "homes#about"

  get "/books" => "books#index"


  post "/books/:id" => "books#create"

  post "/users" => "books#create"

  post "/users/:id" => "books#create"

  delete "/books/:id" => "books#destroy", as: "destroy_book"

  resources :users, only: [:index, :show, :edit, :update]

  resources :books

end