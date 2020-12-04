Rails.application.routes.draw do

  default_url_options :host => "https://form-you-api-staging.herokuapp.com/"

  namespace :api, defaults: { format: :json } do
    resources :users
    resources :categories
    resources :formation_attendances
    resources :formation_categories
    resources :rooms
    resources :roles
    resources :formation_sessions

    resources :users do
      resources :formation_attendances, only: [:index]
      resources :roles, only: [:index]
    end


    resources :formations do 
      resources :formation_sessions, only: [:index, :create] do 
        resources :rooms, only: [:index]
      end
      resources :users, only: [:index]
      resources :rooms, only: [:index]
      resources :categories, only: [:index]
      resources :formation_attendances, only: [:index]
    end

  end



  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end
