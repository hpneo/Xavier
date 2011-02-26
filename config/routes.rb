Xavier::Application.routes.draw do

	devise_for :users
	resources :users
	
	resources :purchases

	resources :categories
	resources :products	do
		get :purchase
		get :add_to_cart
	end
	
	resources :pages
	
	match '/cart' => 'purchases#cart'
	match '/my_products' => 'users#my_products'
	match '/search' => 'search#search'
	match '/advanced_search' => 'search#advanced_search'
	
	root :to => 'home#index'
	
end
