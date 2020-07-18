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
			@economyNews = HTTParty.get("https://newsapi.org/v2/everything?q=economy&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}")
			@coronaNews = HTTParty.get("https://newsapi.org/v2/everything?q=covid&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}")
			@politicaNews = HTTParty.get("https://newsapi.org/v2/everything?q=politica&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}")
		end

		def homeScreenSaudation
			isMorning = (0..11).include?(Time.now.hour) ? true : false
			@saudation = nil
			name = current_user.name.split(" ")[0]
			if current_user
				@saudation = isMorning ? "#{translate 'home.morning_saudation'}, #{name}" : "#{translate 'home.afternoon_saudation'}, #{name}"
			else
				@saudation = isMorning ? "#{translate 'home.morning_saudation'}" : "#{translate 'home.afternoon_saudation'}"
			end
		end

		def availableCategories
			@categories = [
				{name: "Business", path: "/category/business", iconSrc: "https://img.icons8.com/ios/30/000000/handshake.png"},
				{name: "Economia", path: "/category/economia", iconSrc: "https://img.icons8.com/ios/30/000000/banknotes.png"},
				{name: "Bovespa", path: "/category/bovespa", iconSrc: "https://img.icons8.com/ios/30/000000/combo-chart.png"},
				{name: "Viagem", path: "/category/viagem", iconSrc: "https://img.icons8.com/ios/30/000000/airplane-take-off.png"},
				{name: "Saúde", path: "/category/saude", iconSrc: "https://img.icons8.com/ios/30/000000/like.png"},
				{name: "Esportes", path: "/category/esportes", iconSrc: "https://img.icons8.com/ios/30/000000/football2.png"},
				{name: "Apple", path: "/category/apple", iconSrc: "https://img.icons8.com/ios/30/000000/mac-os.png"},
				{name: "Google", path: "/category/google", iconSrc: "https://img.icons8.com/ios/30/000000/google-logo.png"},
				{name: "Amazon", path: "/category/amazon", iconSrc: "https://img.icons8.com/ios/30/000000/amazon.png"},
				{name: "Microsoft", path: "/category/microsoft", iconSrc: "https://img.icons8.com/ios/30/000000/windows-logo.png"},
				{name: "Ciência", path: "/category/ciencia", iconSrc: "https://img.icons8.com/ios/30/000000/physics.png"},
				{name: "Diversão", path: "/category/entretenimento", iconSrc: "https://img.icons8.com/ios/30/000000/tv.png"},
				{name: "Automóveis", path: "/category/automoveis", iconSrc: "https://img.icons8.com/ios/30/000000/tesla-model-3.png"},
				{name: "Decoração", path: "/category/decoracao", iconSrc: "https://img.icons8.com/ios/30/000000/home-decorations.png"},
				{name: "Tecnologia", path: "/category/tecnologia", iconSrc: "https://img.icons8.com/ios/30/000000/internet.png"},
				{name: "Tesla", path: "/category/tesla", iconSrc: "https://img.icons8.com/windows/30/000000/tesla-logo.png"},
				{name: "Cripto Moeda", path: "/category/cripto", iconSrc: "https://img.icons8.com/ios/30/000000/bitcoin.png"}
			]
		end
end
