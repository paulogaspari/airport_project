class Weather

	attr_accessor :conditions, :weather_conditions

	def initialize(weather_conditions = conditions)
		@weather_conditions = weather_conditions
	end

	def conditions
		if choose_weather == true
			@weather_conditions ='sunny' 
		else
			@weather_conditions ='stormy'
		end
	end

	def choose_weather
  		rand <= 0.5
	end

end



