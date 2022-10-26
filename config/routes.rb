Rails.application.routes.draw do
  resources :friendships
  resources :historical_stock_data
  resources :user_stocks
  resources :stocks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
