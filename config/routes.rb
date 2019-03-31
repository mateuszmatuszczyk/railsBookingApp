Rails.application.routes.draw do
  	
  resources :barbers
  devise_for :users
	# Setting the root of the app to home/index view 
 	root 'home#index'
  	
  	get 'home/index'
 	get 'welcome/index'
 	get '/signedinuserprofile' => 'barbers#signedinuserprofile'
end
