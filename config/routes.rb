Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions'
  }

  namespace :users do
    resources :users 
  end

  namespace :doctors do
    resources :doctors do 
      resources :appointments do
        resources :recommendations
      end
    end
  end

  # resources :appointments
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "polyclinic#index"
end
