require_relative '../lib/plane' 


describe Plane do


	it 'should have a pilot' do
		plane = Plane.new
		expect(plane.pilot.count).to eq 1
	end

	it 'should have a co-pilot' do
		plane = Plane.new
		expect(plane.co_pilot.count).to eq 1
	end

	it 'should have 3 stewards' do
			plane = Plane.new
		expect(plane.stewards.count).to eq 3
	end


end