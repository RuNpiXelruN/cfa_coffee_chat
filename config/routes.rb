Rails.application.routes.draw do
  resources :chats, only: :show do
    resources :comments, only: [:new, :create]
  end
  resources :profiles, only: [:show, :update] do
    resources :chats, only: [:new, :create]
    resources :locations, only: [:new, :create], module: :profiles
    resources :posts, only: [:new, :create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index] do
      post 'follow', to: 'following_relationships#create'
    delete 'follow', to: 'following_relationships#destroy'
  end
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
