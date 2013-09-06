require_relative '../lib/weather' 


describe Airport do


	  it 'can have 50% chance to be sunny' do
	  	weather = Weather.new
		weather.stub(:choose_weather).with(true).and_return('sunny')
	  end

	  it 'can have 50% chance to be stormy' do
		weather = Weather.new
		weather.stub(:choose_weather).with(false).and_return('stormy')
	  end





end