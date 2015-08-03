require_relative 'spec_helper'


describe Footman do 
	before :each do
		@footman = Footman.new		
	end

	describe "#attack!" do
		enemy = Barracks.new
		it "should do half of his attack_power to barrack" do
			enemy.should_receive(:damage).with(5)
			@footman.attack!(enemy)
		end

		it "should reduce the barrack's health_points by 5" do
			enemy.damage(5)
			expect(enemy.health_points).to eq(495)
		end

	end
end