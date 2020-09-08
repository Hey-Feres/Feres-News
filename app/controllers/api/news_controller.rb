module Api

    GNEWS_API_BASE_URL = "https://gnews.io/api/v3"
    GNEWS_API_TOKEN = "8f39ec59b3aa7dedc4bfadd6d5c37649"

	class NewsController < ActionController::API

        def today
            news = HTTParty.get("#{GNEWS_API_BASE_URL}/top-news?lang=pt-BR&country=br&token=#{GNEWS_API_TOKEN}")
            render json: news
        end

        def topic
            news = HTTParty.get("#{GNEWS_API_BASE_URL}/topics/#{params[:topic]}?lang=pt-BR&country=br&token=#{GNEWS_API_TOKEN}")
            render json: news
        end

        def search
            news = HTTParty.get("#{GNEWS_API_BASE_URL}/search?q=#{params[:query]}&lang=pt-BR&country=br&token=#{GNEWS_API_TOKEN}")
            render json: news
        end

    end

end