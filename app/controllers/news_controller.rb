class NewsController < ApplicationController
	def category
		requestNews params[:category]
		@categoryName = "#{translate "home.#{params[:category]}"}"
	end
	
	def search
		@news = searchNews(params[:date], params[:search_param])
		render json: @news
	end

	private
		def requestNews category
			@news = HTTParty.get("https://newsapi.org/v2/everything?q=#{category}&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
		end

		def searchNews date, searchParam
			return HTTParty.get("http://newsapi.org/v2/everything?q=#{searchParam}&from=#{date}&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}")
		end
end
