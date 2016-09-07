Melvin::Application.routes.draw do
  root 'home#index'
  get :register,    to: 'home#register'
  get :faq,         to: 'faqs#index'
  get :schedule,    to: 'schedules#index'
  get :subscribers, to: 'subscribers#index'

  [:players, :spectators, :volunteers].each do |type|
    resources type, only: [:new, :create, :update], controller: :subscribers, type: type do
      get :checkout, on: :member
      get :thankyou, on: :member
    end
  end
end
