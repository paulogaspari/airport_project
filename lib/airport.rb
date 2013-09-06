require_relative './plane'
require_relative './weather'


class Airport

	attr_reader :name, :list_of_planes, :capacity, :weather, :threats

	def initialize(name, capacity)
		@name = name
		@list_of_planes = []
		@capacity = capacity
		@weather = []
		@threats = false
	end

	
	def new_plane 
		@list_of_planes << Plane.new if @list_of_planes.count < @capacity
	end

	
	def generate_weather(weather = nil)
		@weather << Weather.new(weather)
	end


	def checking_weather
		airport_weather = @weather.first
		airport_weather.weather_conditions
		#returns weather_conditions = stormy or sunny
	end


	def can_plane_take_off?
		if checking_weather == 'sunny' && !@threats
			true
		else
			false
		end
	end

	def can_plane_land?
		if checking_weather == 'sunny' && !@threats
			true
		else
			false
		end
	end

	def plane_took_off
		@list_of_planes.pop
	end

	def plane_land
		new_plane
	end

	def authorized_for_landing
		plane_land if can_plane_land?
	end

	def authorized_for_takeoff
		plane_took_off if can_plane_take_off?
	end

	def bomb_threats(threats)
		@threats = threats
	end


end