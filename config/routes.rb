Rails.application.routes.draw do

ActiveAdmin.routes(self)
devise_for :users
    as :user do
        get 'signin', to: 'devise/sessions#new'
      get 'signup', to: 'devise/registrations#new'
      delete 'signout', to: 'devise/sessions#destroy'
  end

  get 'feed', to: 'feed#show'

  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :tweets do
   member do
   post 'vote', to: 'votes#create'
   delete 'unvote', to: 'votes#destroy'
   end
  end

  
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html 
  
end
