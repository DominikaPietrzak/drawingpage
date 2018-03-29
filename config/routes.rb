Rails.application.routes.draw do

  get 'contacts/index'

  get 'contacts/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :contactforms, only: [:create, :new, :index]
  resources :aboutmeinfos, only: [:index]
  resources :contacts, only: [:index]
  resources :posts do
  resources :comments
    member do
      put "like" =>"posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end
  resources :mainpages, only:[:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "mainpages#index"


end
