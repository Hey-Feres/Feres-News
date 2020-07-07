class HomeController < ApplicationController
	def index
		getNews
		homeScreenSaudation
		availableCategories
	end

	private
		def getNews
			@usHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=#{Rails.application.credentials.news_api_key}")
			@brHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=#{Rails.application.credentials.news_api_key}")
		end

		def homeScreenSaudation
			isMorning = (0..11).include?(Time.now.hour) ? true : false
			@saudation = isMorning ? "Good Morning, #{current_user.name}" : "Good Afternoom, #{current_user.name}"
		end

		def availableCategories
			@categories = [
				{name: "Sports", path: "/category/sports", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/volleyball-2.png"},
				{name: "Business", path: "/category/business", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/business.png"},
				{name: "Health", path: "/category/health", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/like.png"},
				{name: "Entertainment", path: "/category/entertainment", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/clapperboard.png"},
				{name: "Science", path: "/category/science", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/physics.png"},
				{name: "Technology", path: "/category/technology", iconSrc: "https://img.icons8.com/ios/60/FFFFFF/mouse.png"}
			]
		end
end
