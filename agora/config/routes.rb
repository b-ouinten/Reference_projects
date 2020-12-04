Rails.application.routes.draw do
  namespace :admin do
    resources :users 
      
      resources :categories
      resources :cities
      resources :comments
      resources :likes
      resources :proposals
      resources :votes

      root to: "users#index"
  end
  
  root 'proposals#index'
  get '/contact', to: 'additional_views#contact', as: 'contact'
  get '/proposal_created', to: 'additional_views#proposal_created'
  get '/policy', to: 'additional_views#policy', as: 'policy'
  get '/legal', to: 'additional_views#legal', as: 'legal'
  get '/faq', to: 'additional_views#faq', as: 'faq'
  get '/mon_profil', to: 'users#show', as: 'mon_profil'
  get '/editer_mon_profil', to: 'users#edit', as: 'editer_mon_profil'

  resources :cities
  
  devise_for :users
  resources :users
  resources :users do
    resources :avatars, only: :create
  end

  resources :proposals
  resources :proposals do
    resources :votes, only: [:create, :destroy] 
    resources :pictures, only: :create
    resources :comments do
      resources :likes, only: [:create, :destroy, :edit]
      resources :comments, only: [:create, :destroy, :edit]
    end
  end

  resources :cities do
    resources :proposals do
      resources :votes, only: [:create, :destroy]
    end
  end
end