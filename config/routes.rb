Rails.application.routes.draw do
  resources :chats, only: :show do
    resources :comments, only: [:new, :create]
  end
  resources :profiles, only: [:show, :update] do
    resources :chats, only: [:new, :create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index]
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
