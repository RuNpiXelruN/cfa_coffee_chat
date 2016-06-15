Rails.application.routes.draw do
  resources :profiles, only: [:show, :update]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index]
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
