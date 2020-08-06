## Genius for News methods
module NewsGenius

	def self.search(params, language="pt")
		news = HTTParty.get("http://newsapi.org/v2/everything?q=#{params}&from=today&sortBy=popularity&language=#{language}&apiKey=#{Rails.application.credentials.news_api_key}")
		return news
	end

end