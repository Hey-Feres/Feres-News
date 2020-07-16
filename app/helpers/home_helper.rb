module HomeHelper
	def homeDate
		today = Date.today
		weekDay = today.strftime("%A")
		monthDay = today.strftime("%d")
		monthName = today.strftime("%B")
		return "#{translateWeekDay weekDay}, #{monthDay} de #{translateMonthName monthName}"
	end

	def translateWeekDay weekDay
		case weekDay
		when 'Sunday'
			return "Domingo"
		when 'Monday'
			return "Segunda Feira"
		when 'Tuesday'
			return "Terça Feira"
		when 'Wednesday'
			return "Quarta Feira"
		when 'Thursday'
			return "Quinta Feira"
		when 'Friday'
			return "Sexta Feira"
		when 'Saturday'
			return "Sábado"
		else
			return ""
		end
	end

	def translateMonthName monthName
		case monthName
		when "January"
			return "Janeiro"
		when "February"
			return "Fevereiro"
		when "March"
			return "Março"
		when "April"
			return "Abril"
		when "May"
			return "Maio"
		when "June"
			return "Junho"
		when "July"
			return "Julho"
		when "August"
			return "Agosto"
		when "September"
			return "Setembro"
		when "October"
			return "Outubro"
		when "November"
			return "Novembro"
		when "December"
			return "Dezembro"
		else
			return ""
		end
	end
end
