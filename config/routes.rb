Rails.application.routes.draw do

  root to: 'welcome#index'
  get '/dashboard', to: 'dashboard#index'


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy"


  resources :users, only: [:new, :create]

  namespace :admin do
    resources :gifs, only: [:create, :new, :show]
  end

  resources :gifs, only: [:index]
  resources :categories, only: [:index]


end
