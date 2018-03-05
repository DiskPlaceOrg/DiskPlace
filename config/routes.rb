Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'download_file', to: 'resources#download_file'
  resources :sessions, only: %i[new create destroy]

  resources :users, except: %i[new] do
    resources :resources do
      member do
        get :download
      end
    end
  end

  get 'sessions/new'

  root 'sessions#new'
end
