Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :users, only: [:new, :create]

  get '/dashboard', to: 'dashboard#index'

  delete "/logout", to: "sessions#destroy"

end
