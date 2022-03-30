Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations', sessions: 'sessions' }
  resources :routines
  resources :exercises, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "routines#index"
end
