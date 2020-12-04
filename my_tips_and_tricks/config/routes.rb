Rails.application.routes.draw do
  get 'cities/new'
  # --- Sessions routes --
  resources :sessions, only: [:new, :create, :destroy]
  
  # --- Route for home ---
  root 'gossips#index'
  
  # --- Routes for about_us_controller ---
  get '/contact', to: 'about_us#contact'
  get '/team', to: 'about_us#team'
  
  # --- Routes for gossip_controller ---
  get '/welcome/:user', to: 'gossips#welcome', as: 'welcome'
  resources :gossips
  
  # --- Routes for user controller ---
  resources :users

  # --- Routes for city controller ---
  resources :cities
  
  # --- Routes for comment controller ---
  resources :gossips do
    resources :comments
  end

  # --- Routes for likes controller
  resources :gossips do
    resources :likes
  end
end