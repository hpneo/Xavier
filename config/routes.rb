Xavier::Application.routes.draw do

	devise_for :users
	resources :users

	resources :categories
	resources :products
	
	root :to => 'home#index'
	
end
