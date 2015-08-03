require_relative 'spec_helper'

describe Barracks do
	before :each do
		@barrack = Barracks.new
	end

	it "The barrack should start with a initialized lumber of 500" do
		expect(@barrack.lumber).to eq(500)
	end
	

end