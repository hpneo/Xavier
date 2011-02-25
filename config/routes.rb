Xavier::Application.routes.draw do
	
	resources :categories
	resources :products
	
	devise_for :users
	
	root :to => 'home#index'
	
end
