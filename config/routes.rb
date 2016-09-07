Melvin::Application.routes.draw do
  # devise_for :subscribers, controllers: { registrations: 'subscribers', sessions: 'sessions' }
  root 'home#index'
  get :register, to: 'home#register'
  get :faq,      to: 'faqs#index'
  get :schedule, to: 'schedules#index'

  [:players, :spectators, :volunteers].each do |type|
    resources type, only: [:new, :create, :update], controller: :subscribers, type: type do
      get :checkout, on: :member
      get :thankyou, on: :member
    end
  end

end
