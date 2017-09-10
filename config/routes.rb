Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/dashboard', to: 'dashboard#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"


  resources :users, only: [:new, :create]

  namespace :admin do
    resources :gifs, only: [:create, :new]
  end

  resources :gifs, only: [:index, :show] do
    resources :favorites, only: [:create]
  end

  resources :favorites, only: [:index, :destroy]


  resources :categories, only: [:index]


end
