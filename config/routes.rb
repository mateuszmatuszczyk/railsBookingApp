Rails.application.routes.draw do
 	# root url
  root 'home#index'

  resources :customers do
    resources :appointments do
      resources :services
    end
  end
  resources :appointments do
    resources :services
  end
  
  resources :services do
      resources :appointments
  end

  resources :services
  
  resources :barbers do
    resources :appointments
  end
  

  devise_for :users
  get 'home/index'
 	get '/signedinuserprofile' => 'customers#signedinuserprofile'
  get '/signedinbarberprofile' => 'barbers#signedinbarberprofile'
end
