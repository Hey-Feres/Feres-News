Rails.application.routes.draw do
  	devise_for :users
  	
	get "/category/:category", to: "news#category"
	post "/search", to: "news#search"
	post "/swicth_language", to: "application#swicth_language"
	root "home#index"
end
