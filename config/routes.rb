Rails.application.routes.draw do
 	devise_for :users
  	
  	get "/profile", to: "user#index"
	get "/category/:category", to: "news#category"
	get "/today", to: "news#today"
	get "/categories", to: "news#categories"
	
	post "/search", to: "news#search"
	post "/upload_photo", to: "user#upload_photo"
	
	root "home#index"
end
