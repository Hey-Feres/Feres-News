Rails.application.routes.draw do
	
	mount Pwa::Engine, at: ''

 	devise_for :users
  	
  	get "/profile", to: "user#index"
	get "/category/:category", to: "news#category"
	get "/today", to: "news#today"
	get "/categories", to: "news#categories"
	get "/remove_following/:following_id", to: "user#remove_following"
	get "/add_following/:category", to: "user#new_following"
	get "/news/for_you", to: "news#for_you"

	post "/search", to: "news#search"
	post "/upload_photo", to: "user#upload_photo"

	root "home#index"
end
