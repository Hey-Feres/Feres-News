class Story < ApplicationRecord
	def self.today country
		todayHeadlines = HTTParty.get("https://newsapi.org/v2/top-headlines?country=#{country}&apiKey=#{Rails.application.credentials.news_api_key}")["articles"]
		todayHeadlines = todayHeadlines.map{ |headline| { title: headline["title"], img: headline["urlToImage"], description: headline["description"], imgOrientation: Story.getImageOrientation(headline["urlToImage"]) } }
	end

	def self.getImageOrientation imgSource
		begin
  			imgSource = URI.parse(imgSource)
			image = MiniMagick::Image.open(imgSource)
	    	if image[:height] > image[:width]
	    		return "portrait"
	    	elsif image[:height] < image[:width]
	    		return "landscape"
	   		else
	   			return nil
	   		end
	   	rescue
	   		return nil
	   	end
	end
end
