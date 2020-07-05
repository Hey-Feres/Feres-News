Rails.application.routes.draw do
	
	get "/sports", to:  "home#sports"
	get "/business", to:  "home#business"
	get "/health", to:  "home#health"
	get "/entertainment", to:  "home#entertainment"
	get "/science", to:  "home#science"
	get "/technology", to:  "home#technology"

	root "home#index"
end
