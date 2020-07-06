class NewsController < ApplicationController
	def sports
		requestNews "sports"
	end

	def business
		requestNews "business"
	end	

	def health
		requestNews "health"
	end

	def entertainment
		requestNews "entertainment"
	end

	def science
		requestNews "science"
	end

	def technology
		requestNews "technology"
	end

	private
		def requestNews category
			@news = HTTParty.get("https://newsapi.org/v2/everything?q=#{category}&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
		end
end
