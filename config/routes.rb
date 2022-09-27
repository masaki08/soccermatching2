Rails.application.routes.draw do
  get 'entrys/show'
  get 'entrys/index'
  get 'entrys/edit'
  #get 'rooms/show'
  #get 'rooms/index'
  #get 'rooms/edit'
   devise_for :customers,controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  get "customers/show" => "customers#show"

  resources :posts do
    resources :comments, only: [:edit, :show, :update, :create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :customers do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  root :to =>"homes#top"
  get 'search' => 'posts#search'
  get 'messeges/index'
  get 'messeges/new'
  get 'messeges/show'
  get 'messeges/edit'
  get 'homes/top'

  resources :customers, only: [:show,:edit,:update]
  resources :rooms, only: [:create, :show] do
    resources :messages, only: [:create]
  end

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  namespace :admin do
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
