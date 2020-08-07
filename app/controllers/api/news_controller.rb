module Api
	
	## News Requests will be processed here
	class NewsController < ActionController::API
		
		# Modules
		include NewsGenius

		# Actions

		def highlights
			@highlights = NewsGenius.highlights
			render json: @highlights
		end

		## Search Request Handler
		def search
			@news_founded = NewsGenius.search(params[:params])
			render json: @news_founded
		end

	end

end