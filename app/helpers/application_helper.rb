module ApplicationHelper
	def user
		return current_user if current_user.present?
	end
end
