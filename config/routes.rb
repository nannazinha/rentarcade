Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'items#index'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items do
    resources :transactions, only: [:show, :new, :create]
    resources :reviews, only:[:show, :new, :create]
  end

  resources :transactions, only: [:index]

  get "/panel", to: "users#panel", as: :panel
  get "/profile", to: "users#profile", as: :profile

  patch "/return/:id", to: "items#return", as: :return

  get "/transactions/:id/confirmed", to: "transactions#confirmed", as: :confirmed
  post "/transactions/:id/new_budget", to: "transactions#new_budget", as: :new_budget

end

