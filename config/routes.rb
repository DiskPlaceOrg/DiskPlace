Rails.application.routes.draw do

  resources :sessions, only: %i[new create destroy]

  resources :users

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'sessions/new'

  root 'sessions#new'
end
