Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :stocks, except: [:update, :destroy]
  resources :users, except: [:show, :index]
  resources :friendships, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post "/login", to: "users#login"
  post "/stocksearch", to:"stocks#search"
  post "/deleteuser/:id", to:"users#destroy"
  get "/getuserexample/:id", to:"users#example_get"
  get "/profile", to: "users#profile"
  get "/news", to: "application#get_news"
  get "/myportfolio", to: "users#my_portfolio"
  post "/stockhistory", to: "stocks#stock_history"
  get "/friends/:id", to: "users#my_friends"
  get "/refresh", to: "users#refresh_portfolio"
  post "/usersearch", to: "users#search_users"
  get "/stockrefresh/:id", to: "stocks#refresh_data"
  delete "/friendship/:id", to: "friendships#destroy"
end