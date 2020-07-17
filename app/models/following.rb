class Following < ApplicationRecord
	belongs_to :user

	def self.add user_id, title
		following = Following.create!(user_id: user_id, title: title)
		if following
			return {saved: true, result: following}
		else 
			return {saved: false}
		end
	end

	def self.remove id
		if Following.find(id).delete
			return true
		else
			return false
		end
	end
end
