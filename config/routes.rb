Rails.application.routes.draw do
 	devise_for :users

 	namespace :api, defaults: { format: 'json' } do
 		get "/search/:params", to: "news#search"
 	end
  	
  	get "/profile", to: "user#index"
	get "/category/:category", to: "news#category"
	get "/today", to: "news#today"
	get "/categories", to: "news#categories"
	get "/remove_following/:following_id", to: "user#remove_following"
	get "/add_following/:category", to: "user#new_following"
	get "/news/for_you", to: "news#for_you"

	post "/upload_photo", to: "user#upload_photo"

	root "home#index"
end
