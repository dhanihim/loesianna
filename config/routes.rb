Rails.application.routes.draw do
  resources :client_activities
  resources :activities
  resources :client_personal_files
  resources :personal_files
  resources :clients
  
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
