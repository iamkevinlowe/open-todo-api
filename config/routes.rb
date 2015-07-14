Rails.application.routes.draw do

  resources :users, only: [:create, :show] do
    resources :lists, only: [:show]
  end

  resources :lists, only: [] do
    resources :items, only: [:create, :update]
  end

  resources :sessions, only: [:create]

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create, :update]
    end

    resources :items, only: [:destroy]
  end

  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#new", as: "log_in"
  get "sign_up" => "users#new", as: "sign_up"
  root to: 'welcome#index'
end