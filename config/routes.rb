Rails.application.routes.draw do
  devise_for :users

  root to: "flats#index"
  #root to: "pages#home"

  resources :flats do
    resources :bookings
  end

  get "my_bookings", to: "bookings#my_bookings"

  get "my_flats", to: "flats#my_flats"



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
