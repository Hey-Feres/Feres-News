class UserController < ApplicationController
	before_action :set_user
	def index  		
 	end

 	def upload_photo
 		@user.photo.attach(params[:photo])
 	end
 	
 	private
 		def set_user
 			@user = current_user
 		end
end
