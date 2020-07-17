class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
	
	validates_presence_of :name

	has_one_attached :photo
end
