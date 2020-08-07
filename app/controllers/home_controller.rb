class HomeController < ApplicationController
	
	# Modules
	include NewsGenius

	# Actions

	def index
		@highlights = NewsGenius.highlights
	end

	private

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