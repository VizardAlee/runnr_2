Rails.application.routes.draw do
  get 'products/new'
  get 'products/create'
  get 'products/show'
  get 'stores/new'
  get 'stores/create'
  get 'stores/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users do
    member do
      patch :switch_role
    end
  end
  
  resources :stores do
    resources :products, only: [:new, :create, :index]
  end
  # resources :products
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
