Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "home/about" => "homes#about"
  devise_for :users

  get "/books" => "books#index"

  resources :users, only: [:index, :show, :edit] do
   resources :books
  end

end