Rails.application.routes.draw do
  devise_for :users
  resources :listings
  root to: "listings#index"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
end
