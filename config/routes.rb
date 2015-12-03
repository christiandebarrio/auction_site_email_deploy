Rails.application.routes.draw do
  get "/" => "site#home"

  resources :users, only: [:show, :new, :index, :create, :destroy] do
    resources :products, only: [:index, :show, :new, :create, :destroy] do
      resources :reviews, only: [:create]
      resources :bids, only: [:create]
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
