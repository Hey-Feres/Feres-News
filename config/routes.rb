Rails.application.routes.draw do
  	devise_for :users
  	
	get "/category/:category", to: "news#category"
	post "/search", to: "news#search"
	root "home#index"
end
