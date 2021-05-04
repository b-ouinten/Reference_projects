Rails.application.routes.draw do
  get 'provisional_cart_items/index'
  get 'provisional_cart_items/create'
  root 'items#index'
  
  # devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users, except: [:show, :edit]
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
  resources :orders

  resources :items
  
  resources :cart_items, only: [:index, :update, :destroy]
  resources :items do 
    resources :cart_items, only: [:create]
  end

  resources :provisional_cart_items, only: [:index, :update, :destroy]
  resources :items do
    resources :provisional_cart_items, only: :create
  end
  
  resources :categories do
    resources :items
  end
  
  resources :items, only: [:show] do
    resources :images, only: [:create]
  end

  # Add pesonalized routes
  get '/mon_panier', to: 'carts#show', as: 'mon_panier'
  get '/mon_profil', to: 'users#show', as: 'mon_profil'
  get '/editer_mon_profil', to: 'users#edit', as: 'editer_mon_profil'
  get '/contact', to: 'carts#contact'
end