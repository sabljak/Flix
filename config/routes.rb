Rails.application.routes.draw do
  resources :genres
  root "movies#index"

  resources :users
  get "signup" => "users#new"

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
end
