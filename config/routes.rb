Rails.application.routes.draw do

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
    resources :doctors 
  end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "polyclinic#index"
end
