class NewsController < ApplicationController
	def category
		requestNews params[:category]
		@categoryName = params[:category].capitalize!
	end

	private
		def requestNews category
			@news = HTTParty.get("https://newsapi.org/v2/everything?q=#{category}&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
		end
end
