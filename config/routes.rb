Rails.application.routes.draw do
  root to: 'topics#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'tags', to: 'topics#tags'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
  resources :topics
end
