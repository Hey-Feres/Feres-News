## Genius for News methods
module NewsGenius

	def self.search(params, language="pt")
		news = HTTParty.get("http://newsapi.org/v2/everything?q=#{params}&from=today&sortBy=popularity&language=#{language}&apiKey=#{Rails.application.credentials.news_api_key}")
		return news
	end
	
	def self.highlights(language="pt")
		news = HTTParty.get("https://newsapi.org/v2/top-headlines?country=br&apiKey=#{Rails.application.credentials.news_api_key}")["articles"]
		return news
	end

	def self.category
	end
end