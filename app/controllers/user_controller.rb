class UserController < ApplicationController
	before_action :set_user
	def index  		
		@following = @user.following
 	end

 	def upload_photo
 		@user.photo.attach(params[:photo])
 	end

	def new_following
		response = Following.add(@user.id, params[:category])
		if response[:saved]
			render json: response[:result]
		else
			render json: false
		end
	end

	def remove_following
		response = Following.remove(params[:following_id])
		render json: response
	end

 	private
 		def set_user
 			@user = current_user
 		end
end
