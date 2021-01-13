Rails.application.routes.draw do
  resources :reviews
  root "movies#index"
  resources:movies do
    resources:reviews
  end
end
