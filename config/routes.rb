Rails.application.routes.draw do
  	devise_for :users
  	
	get "/category/:category", to: "news#category"
	get "/today", to: "news#today"
	get "/categories", to: "news#categories"
	post "/search", to: "news#search"
	root "home#index"
end
