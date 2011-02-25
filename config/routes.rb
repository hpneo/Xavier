Xavier::Application.routes.draw do
	
	resources :categories
	resources :products
	
	root :to => 'home#index'
	
end
