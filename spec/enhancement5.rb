require_relative 'spec_helper'

describe Barracks do
	before :each do
		@barrack = Barracks.new
	end

	describe "#can_train_seige_engine?" do
		it "Should return true if it can train a seige_engine" do
			expect(@barrack.can_train_seige_engine?).to be_truthy
		end

		it "Should return false if it doesn't have enough gold" do
			@barrack.should_receive(:gold).and_return(50)
			expect(@barrack.can_train_seige_engine?). to be_falsey
		end

		it "Should return false if it doesn't have enough food" do
			@barrack.should_receive(:food).and_return(1)
			expect(@barrack.can_train_seige_engine?). to be_falsey
		end

		it "Should return false if it doesn't have enough lumber" do
			@barrack.should_receive(:lumber).and_return(50)
			expect(@barrack.can_train_seige_engine?). to be_falsey
		end

	end

	describe "#train_seige_engine?" do
		
		it "Should reduce the gold by 200 for a seige_engine" do
			@barrack.train_seige_engine
			expect(@barrack.gold).to eq(800)
		end

		it "Should reduce the gold by 3 for a seige_engine" do
			@barrack.train_seige_engine
			expect(@barrack.food).to eq(77)
		end

		it "Should reduce the gold by 60 for a seige_engine" do
			@barrack.train_seige_engine
			expect(@barrack.lumber).to eq(440)
		end

	end

end

describe Seige_engine do
	before :each do
		@seige_engine = Seige_engine.new
	end

	it "return true if the seige_engine has 400 HP" do
		expect(@seige_engine.health_points).to eq(400)
	end
	it "return true if the seige_engine has 50 AP" do
		expect(@seige_engine.attack_power).to eq(50)
	end

	describe "#attack!" do
		it "returns can't attack unit when attack a normal unit" do
			enemy = Footman.new
			expect(@seige_engine.attack!(enemy)).to eq("can't attack Footman and Peasant!")
		end

		it "reduce barrack's health_points by twice of its attack_power!" do
			enemy = Barracks.new
			expect(@seige_engine.attack!(enemy)).to eq(400)
		end

		it "reduce seige_engine's health_points by its attack_power" do
			enemy = Seige_engine.new
			expect(@seige_engine.attack!(enemy)).to eq(350)
		end
	end

	describe "#damage" do
		it "recude its health_points when taken specified attack_power" do
			@seige_engine.damage(19)
			expect(@seige_engine.health_points).to eq(381)
		end
	end



end