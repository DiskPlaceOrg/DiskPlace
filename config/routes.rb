Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: %i[new create destroy]

  resources :users, except: %i[new] do
    resources :resources, only: %i[index new create destroy]
  end

  get 'sessions/new'

  root 'sessions#new'
end
