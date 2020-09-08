Rails.application.routes.draw do
 	devise_for :users

    namespace :api do
        get "/today", to: "news#today"
        get "/topic/:topic", to: "news#topic"
        get "/search/:query", to: "news#search"
    end

	root "home#index"
end
