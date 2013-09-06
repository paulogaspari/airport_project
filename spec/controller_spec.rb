require_relative '../lib/controller' 


describe Controller do



	it ' can authorize a plane to depart' do
		controller = Controller.new
		expect(controller.give_permission?).to be_true
	end

end