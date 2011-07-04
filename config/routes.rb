Xavier::Application.routes.draw do
	
	match '/contact_us' => 'supports#new'
	
	resources :supports, :only => [:new, :create]

	match '/attachments/create' => 'attachments#create'
	match '/attachments/manage' => 'attachments#manage'

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
	match '/change_language' => 'home#language'
	
	root :to => 'home#index'
	
	namespace :admin do
		root :to => 'home#index'
		resources :pages
		resources :categories
		resources :products
		resources :users
		resources :slides
		resources :site_options
	end
	
	post "versions/:id/revert" => "versions#revert", :as => "revert_version"
	
end
