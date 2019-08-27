Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    resources :transactions, only: [:show, :new, :create]
  end
  resources :transactions, only: [:index]
  get "/my_account", to: "pages#my_account", as: :my_account
end

