require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: [:show]
    namespace :admin do
      resources :users, only: [:index, :destroy]
    end

  resources :posts, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get 'detail'
    end
  end

  resources :messages, only: [:index, :show, :create]
  resources :bulletins, only: [:index, :create, :destroy]
  resources :newsletters, only: [:index, :create, :destroy]

  root 'home#index'

  authenticate :user, -> (u) {u.admin?} do
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
