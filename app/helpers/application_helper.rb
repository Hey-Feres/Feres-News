module ApplicationHelper
	def user
		return current_user if current_user.present?
	end
	def saudation
		isMorning = (0..11).include?(Time.now.hour) ? true : false
		@saudation = nil
		if current_user
			name = current_user.name.split(" ")[0]
			@saudation = isMorning ? "#{translate 'home.morning_saudation'}, #{name}" : "#{translate 'home.afternoon_saudation'}, #{name}"
		else
			@saudation = isMorning ? "#{translate 'home.morning_saudation'}" : "#{translate 'home.afternoon_saudation'}"
		end
		@saudation
	end
end
