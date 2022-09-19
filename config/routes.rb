Rails.application.routes.draw do
   devise_for :customers,controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  resources :posts do
    resources :comments, only: [:edit, :show, :update, :create, :destroy]
  end

  resources :customers do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  root :to =>"homes#top"
  get 'messeges/index'
  get 'messeges/new'
  get 'messeges/show'
  get 'messeges/edit'
  get 'homes/top'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
