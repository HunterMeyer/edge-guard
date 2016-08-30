Melvin::Application.routes.draw do
  root 'home#index'
  get :register, to: 'home#register'

  [:players, :spectators, :volunteers].each do |type|
    resources type, only: [:new, :create], controller: :subscribers, type: type do
      get :checkout, on: :member
      get :thankyou, on: :member
    end
  end
end
