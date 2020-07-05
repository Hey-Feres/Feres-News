class HomeController < ApplicationController
	def index
		@usHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=us&apiKey=dbd8a962d3004ce993c040c8a3f23ff6")
		@brHeadLines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=dbd8a962d3004ce993c040c8a3f23ff6")
		@isMorning = (0..11).include?(Time.now.hour) ? true : false
	end
	
	def sports

	end

	def business
		
	end	

	def health
		
	end

	def entertainment
		
	end

	def science
		
	end

	def technology
		
	end
end
