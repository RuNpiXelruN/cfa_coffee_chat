Rails.application.routes.draw do
  get 'chat_list', to: "chats#chat_list"
  get 'user_list', to: "users#user_list"
  resources :chats, only: [:show, :update, :index] do
    resources :comments, only: [:new, :create]
  end
  resources :comments, only: [:edit, :update, :destroy]
  resources :posts, only: [:edit, :update, :destroy]
  resources :locations, only: [:edit, :update]
  resources :profiles, only: [:show, :edit, :update] do
    resources :chats, only: [:new, :create]
    resources :locations, only: [:new, :create], module: :profiles
    resources :posts, only: [:new, :create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index, :update] do
      post 'follow', to: 'following_relationships#create'
    delete 'follow', to: 'following_relationships#destroy'
      post 'tutor',  to: 'tutoring_relationships#create'
    delete 'tutor',  to: 'tutoring_relationships#destroy'
  end
  root 'home#index'
end
