Melvin::Application.routes.draw do
  root 'home#index'
  get :register, to: 'home#register'

  resources :players, only: [:new, :create]
  resources :spectators, only: [:new, :create]
  resources :volunteers, only: [:new, :create]
end
