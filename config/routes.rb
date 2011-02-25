Xavier::Application.routes.draw do

	devise_for :users
	resources :users

	resources :categories
	resources :products
	
	resources :pages
	
	root :to => 'home#index'
	
end
