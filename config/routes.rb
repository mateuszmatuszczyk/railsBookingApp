Rails.application.routes.draw do
  	
  devise_for :users
	# Setting the root of the app to home/index view 
 	root 'home#index'
  	
  	get 'home/index'
 	get 'welcome/index'
end
