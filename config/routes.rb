Rails.application.routes.draw do
  resources :client_activity_processlists do 
    member do 
      get :finish
    end
  end
  resources :processlists
  resources :datalists
  resources :client_activity_datalists do 
    member do 
      get :list
    end
  end
  resources :client_activities do 
    member do 
      get :datalist
      get :processlist
      get :summary
    end
  end
  resources :activities
  resources :client_personal_files
  resources :personal_files
  resources :clients do 
    collection do 
      get :searchresult
    end
  end
  
  root 'home#index'
  get 'home/calendar'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
