Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show, :new, :create] do
    member do
      patch :switch_role
    end
  end

  namespace :admin do
    resource :store, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :products, only: [:new, :create, :index, :edit, :update, :destroy]
    end
    root 'stores#show'
  end

  resources :products, only: [:show, :index]

  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
