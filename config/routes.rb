Rails.application.routes.draw do
  	devise_for :users
  	
	get "/category/:category", to: "news#category"
	root "home#index"
end
