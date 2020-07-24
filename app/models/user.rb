class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	
	validates_presence_of :name

	has_one_attached :photo

	has_many :following, dependent: :destroy

	def self.forYou id
		interests = User.find(id).following.map{ |f| f.title.downcase }
		@forYou = Array.new
		interests.map{ |interest| @forYou << HTTParty.get("https://newsapi.org/v2/everything?q=#{interest}&sortBy=popularity&language=#{@language}&apiKey=#{Rails.application.credentials.news_api_key}")["articles"] }		
		@forYou
	end
end
