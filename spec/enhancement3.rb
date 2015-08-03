require_relative 'spec_helper'

describe Unit do 
	before :each do
		@unit = Unit.new(10,10)
	end

	describe "#attack!" do
		enemy = Unit.new(0,10)
		it "the dead unit which has 0 health_points can't attack other enemy unit!" do
			expect(enemy.attack!(@unit)).to eq("Dead unit can't attack other alive unit!")
		end

		it "the live unit can't attack dead unit!" do
			expect(@unit.attack!(enemy)).to eq("This unit is dead, alive unit can't dead unit!")
		end	

	end
	
end