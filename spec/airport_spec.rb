require_relative '../lib/airport' 


describe Airport do

  let(:airport){Airport.new('heathrow', 5)}


  	it 'can be referenced by name' do 
  		expect(airport.name).to eq 'heathrow'
  	end


	it 'can create a list of plane details' do 
    	airport.new_plane
    	expect(airport.list_of_planes).to be_true
  	end


	it 'can have a plane' do
		airport.new_plane
    	expect(airport.list_of_planes.length).to eq 1 
	end

	it 'has maximum capacity' do
		expect(airport.capacity). to eq 5
	end

	it 'cannot allow a plane to land if it is at full capacity' do
		airport.new_plane
		airport.new_plane
		airport.new_plane
		airport.new_plane
		airport.new_plane
		airport.new_plane
		airport.new_plane
		expect(airport.list_of_planes.count).to eq 5
	end


	it 'has assigned weather conditions' do
		airport.generate_weather
		expect(airport.weather.count).to eq 1 
	end

	it 'has a sunny weather' do
		airport.generate_weather('sunny')
		expect(airport.weather.first.weather_conditions).to eq 'sunny'
	end

	it 'has a stormy weather' do
		airport.generate_weather('stormy')
		expect(airport.weather.first.weather_conditions).to eq 'stormy'
	end

	it 'can have a plane taking off' do
		airport.new_plane
		airport.new_plane
		airport.plane_took_off
		expect(airport.list_of_planes.count).to eq 1
	end

	it 'can have a plane landing' do
		airport.plane_land
		expect(airport.list_of_planes.count).to eq 1
	end

	it "can't have an airplane take off with bad weather" do
		airport.new_plane
		airport.generate_weather('stormy')
		expect(airport.can_plane_take_off?).to be_false
		expect(airport.list_of_planes.count).to eq 1

	end 

	it "can have an airplane take off with sunny weather" do
		airport.new_plane
		airport.generate_weather('sunny')
		expect(airport.can_plane_take_off?).to be_true
	end 

	it "can't have an airplane land with stormy weather" do
		airport.generate_weather('stormy')
		expect(airport.can_plane_land?).to be_false
	end 

	it "can have an airplane land with sunny weather" do
		airport.generate_weather('sunny')
		expect(airport.can_plane_land?).to be_true
	end 

	it 'should have one more plane in the airport when its good weather and a plane lands' do
		airport.generate_weather('sunny')
		airport.authorized_for_landing
		expect(airport.list_of_planes.count).to eq 1
	end

	it 'should have one less plane in the airport when its good weather and a plane takes off' do
		airport.new_plane
		airport.generate_weather('sunny')
		airport.authorized_for_takeoff
		expect(airport.list_of_planes.count).to eq 0
	end


	context '::::::::::::: BOMB THREATS ARE INTRODUCED ::::::::::::::' do


		it 'can have bomb threats' do
			airport.bomb_threats(true)
			expect(airport.threats).to be_true
		end

		it 'can have a bomb threat and planes cannot take off' do
			airport.new_plane
			airport.generate_weather('sunny')
			airport.bomb_threats(true)
			expect(airport.can_plane_take_off?).to be_false
		end

		it 'can have a bomb threat called off' do
			airport.bomb_threats(true)
			airport.bomb_threats(false)
			expect(airport.threats).to be_false
		end

	end


		context '::::::::::::: AIR TRAFFIC CONTROLLER GIVES PERMISSION ::::::::::::::' do


			it 'asks controller for permission and departs' do
				airport.new_plane
				airport.generate_weather('sunny')
				airport.all_clear_to_go
				expect(airport.list_of_planes.count).to eq 0
			end
			
		end


end
