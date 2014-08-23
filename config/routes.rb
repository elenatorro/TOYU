Rails.application.routes.draw do

  root 'home#index'

  delete "log_out" => "sessions#destroy", :as => "log_out"
  post "log_in" => "sessions#create", :as => "log_in"

  resources :sessions,    only: [:create, :new, :destroy]
  resources :site_requirements, only: [:edit, :update]
  resources :personas, only: [:new, :create, :edit, :update, :destroy]
  resources :scenarios, only: [:new, :create, :edit, :update, :destroy]
  resources :user_requirements, only: [:new, :create, :edit, :update, :destroy]
  resources :use_cases, only: [:new, :create, :edit, :update, :destroy]
  resources :analyses, only: [:new, :create, :edit, :update, :destroy]
  resources :cards, only: [:new, :create, :edit, :update, :destroy]
  resources :sorting_tests, only: [:new, :create, :edit, :update, :destroy]
  resources :projects do
    get :confirm, on: :collection
    resources :site_requirements, only: [:index, :show]
    resources :personas, only: [:index, :show]
    resources :scenarios, only: [:index, :show]
    resources :user_requirements, only: [:index, :show]
    resources :sorting_tests, only: [:index, :show]
    resources :interviews
    resources :analyses, only: [:index, :show]
    resources :use_cases, only: [:index, :show]
  end
end
