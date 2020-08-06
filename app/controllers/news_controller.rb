class NewsController < ApplicationController
	def today
		@news = indexNews
		saudation
	end

	def category
		requestNews params[:category]
		@categoryName = params[:category].capitalize!
		if current_user
			@following = Following.where('title LIKE ? AND user_id = ?', "#{@categoryName}%", current_user.id).last
		end
	end
	
	def categories
		
	end
	
	def for_you
		if current_user
			render json: User.forYou(current_user.id)
		end
	end

	private
		def requestNews category
			@news = HTTParty.get("https://newsapi.org/v2/everything?q=#{category}&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
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
