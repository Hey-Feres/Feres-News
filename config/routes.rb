Rails.application.routes.draw do
  	devise_for :users
  	
	get "/category/:category", to: "news#category"
	get "/news", to: "news#index"
	get "/today_news", to: "home#today_news"
	post "/search", to: "news#search"
	root "home#index"
end
