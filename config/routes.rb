Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/new'
  root :to =>"homes#top"
  get 'relationships/index'
  get 'relationships/new'
  get 'relationships/show'
  get 'relationships/edit'
  get 'messeges/index'
  get 'messeges/new'
  get 'messeges/show'
  get 'messeges/edit'
  get 'commernts/index'
  get 'commernts/new'
  get 'commernts/show'
  get 'commernts/edit'
  get 'homes/top'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers,controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
