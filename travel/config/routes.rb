Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]

  get 'hotel_search', to: 'hotel_search#index'
  get 'hotel_search/results', to: 'hotel_search#results'
  get 'hotel_reviews', to: 'hotel_reviews#index'

  resources :hotels, only: [:index]

  get 'onsen_search', to: 'onsen_search#index'
  get 'onsen_search/results', to: 'onsen_search#results'
end