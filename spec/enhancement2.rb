require_relative 'spec_helper'

describe Unit do

	before :each do
		@unit = Unit.new(10,10)
	end

	describe "#attack!" do
		enemy = Unit.new(10,10)
		it "deal 10 attack_power to enemy unit" do
			enemy.should_receive(:damage).with(10)
			@unit.attack!(enemy)
		end

		it "reduces enemy's health_points by specified attack_power" do
			enemy.damage(10)
			expect(enemy.health_points).to eq(0)
		end

	end


	describe "#dead?" do
		unit = Unit.new(10,10)
		it "should return true if the unit has less than 1 health_points" do
			expect(unit.dead?).to be false
		end

		it "should return true if it was attacked by other unit by 10 attack_power" do
			1.times do @unit.attack!(unit)
			end
			expect(unit.dead?).to be true
		
		end

	end

	describe "#damage" do
		unit = Unit.new(0,10)
		it "should return the unit is dead if the unit has 0 health_points or less" do
			# unit.should_receive(:damage).with(10)
			# expect(unit.damage).to eq("this unit dead!")
			expect(unit.damage(10)).to eq("this unit is dead!")
		end
	end

end