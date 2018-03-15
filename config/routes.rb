Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :aboutmeinfos, only: [:index]
  resources :contacts, only: [:index]
  resources :posts do
  resources :comments
  end
  resources :mainpages, only:[:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "mainpages#index"


end
