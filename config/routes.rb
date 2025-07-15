Rails.application.routes.draw do
  get 'reservations/new'
  get 'reservations/create'
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :grannies do
    resources :reservations, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  get "dashboard/bookings", to: "dashboard#bookings"
  get "dashboard/listings", to: "dashboard#listings"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
