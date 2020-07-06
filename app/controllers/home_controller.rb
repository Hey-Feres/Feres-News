class HomeController < ApplicationController
	def index
		getNews
		homeScreenSaudation
	end

	private
		def getNews
			@usHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=#{Rails.application.credentials.news_api_key}")
			@brHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=#{Rails.application.credentials.news_api_key}")
		end

		def homeScreenSaudation
			isMorning = (0..11).include?(Time.now.hour) ? true : false
			@saudation = isMorning ? "Good Morning, #{current_user.name}" : "Good Afternoom, Bruno"
		end
end
