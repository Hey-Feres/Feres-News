class HomeController < ApplicationController
	def index
		getNews
		homeScreenSaudation
		availableCategories
		locale
	end

	private
		def locale
			@locale = {
				flag: @language == "en" ? "brazil" : "usa",
				path: @language == "en" ? "#{request.path}?locale=pt-BR" : "#{request.path}?locale=en"
			}
		end

		def getNews
			@topHeadlines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=#{@country}&apiKey=#{Rails.application.credentials.news_api_key}")
		end

		def homeScreenSaudation
			isMorning = (0..11).include?(Time.now.hour) ? true : false
			@saudation = nil
			if current_user
				@saudation = isMorning ? "#{translate 'home.morning_saudation'}, #{current_user.name}" : "#{translate 'home.afternoon_saudation'}, #{current_user.name}"
			else
				@saudation = isMorning ? "#{translate 'home.morning_saudation'}" : "#{translate 'home.afternoon_saudation'}"
			end
		end

		def availableCategories
			@categories = [
				{name: "#{translate 'home.sports'}", path: "/category/sports", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/volleyball-2.png"},
				{name: "#{translate 'home.business'}", path: "/category/business", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/business.png"},
				{name: "#{translate 'home.health'}", path: "/category/health", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/like.png"},
				{name: "#{translate 'home.fun'}", path: "/category/entertainment", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/clapperboard.png"},
				{name: "#{translate 'home.science'}", path: "/category/science", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/physics.png"},
				{name: "#{translate 'home.technology'}", path: "/category/technology", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/mouse.png"}
			]
		end
end
