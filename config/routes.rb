Rails.application.routes.draw do
  root "movies#index"

  resources :users

  resources:movies do
    resources:reviews
  end
  
  get "signup" => "users#new"
end
