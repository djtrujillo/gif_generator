Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"


  resources :users, only: [:new, :create] do
    resources :favorites, only: [:index, :destroy]
  end

  namespace :admin do
    resources :gifs, only: [:create, :new, :destroy, :index, :show]
    resources :categories, only: [:create, :destroy, :show]
  end

  resources :gifs, only: [:index, :show] do
    resources :favorites, only: [:create]
  end







end
