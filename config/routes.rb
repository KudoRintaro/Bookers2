Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'homes#top'

  get "home/about" => "homes#about"

  get "/books" => "books#index"


  resources :users, only: [:index, :show, :edit] do
   resources :books
  end

end