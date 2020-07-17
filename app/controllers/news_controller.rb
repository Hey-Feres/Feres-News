class NewsController < ApplicationController
	def today
		@news = indexNews
		saudation
	end

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

		def indexNews
			return HTTParty.get("https://newsapi.org/v2/top-headlines?country=#{@country}&apiKey=#{Rails.application.credentials.news_api_key}")["articles"]
		end

		def saudation
			isMorning = (0..11).include?(Time.now.hour) ? true : false
			@saudation = nil
			if current_user
				@saudation = isMorning ? "#{translate 'home.morning_saudation'}, #{current_user.name}" : "#{translate 'home.afternoon_saudation'}, #{current_user.name}"
			else
				@saudation = isMorning ? "#{translate 'home.morning_saudation'}" : "#{translate 'home.afternoon_saudation'}"
			end
		end
end
