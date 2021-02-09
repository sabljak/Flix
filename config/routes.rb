Rails.application.routes.draw do
  root "movies#index"

  resources :users
  get "signup" => "users#new"

  resources:movies do
    resources:reviews
  end

  resource :session, only: [:new, :create, :destroy]
  get "login" => "sessions#new"
end
