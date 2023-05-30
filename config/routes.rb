Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"

  resources :flats
  get "my_flats", to: "flats#my_flats"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
