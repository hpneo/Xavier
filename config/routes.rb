Xavier::Application.routes.draw do

	devise_for :users
	resources :users
	
	resources :purchases

	resources :categories
	resources :products	do
		get :purchase
	end
	
	resources :pages
	
	match '/cart' => 'purchases#cart'
	match '/my_products' => 'users#my_products'
	
	root :to => 'home#index'
	
end
