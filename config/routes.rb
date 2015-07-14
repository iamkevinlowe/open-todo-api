Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  namespace :api, defaults: { format: :json } do
    resources :users
  end

  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#new", as: "log_in"
  root to: 'welcome#index'
end
