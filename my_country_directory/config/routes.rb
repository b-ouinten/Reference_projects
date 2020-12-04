Rails.application.routes.draw do
  # Route for root
  root to: 'home#index'

  # Set Devise routes
  devise_for :accounts
end