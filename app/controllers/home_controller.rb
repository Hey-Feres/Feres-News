class HomeController < ApplicationController
	def index
		@usHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=#{Rails.application.credentials.news_api_key}")
		@brHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=#{Rails.application.credentials.news_api_key}")
		@isMorning = (0..11).include?(Time.now.hour) ? true : false
	end

	def sports
		@news = HTTParty.get("https://newsapi.org/v2/everything?q=sports&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
	end

	def business
		@news = HTTParty.get("https://newsapi.org/v2/everything?q=business&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
	end	

	def health
		@news = HTTParty.get("https://newsapi.org/v2/everything?q=health&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
	end

	def entertainment
		@news = HTTParty.get("https://newsapi.org/v2/everything?q=entertainment&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
	end

	def science
		@news = HTTParty.get("https://newsapi.org/v2/everything?q=science&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
	end

	def technology
		@news = HTTParty.get("https://newsapi.org/v2/everything?q=technology&apiKey=#{Rails.application.credentials.news_api_key}").parsed_response['articles']
	end
end
