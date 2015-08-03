class Seige_engine < Unit
	
	def initialize
		super(health_points,attack_power)
		@health_points = 400
		@attack_power = 50
	end


	def attack!(enemy)
		if enemy.is_a? Barracks
			enemy.damage(@attack_power*2)
		elsif enemy.is_a? Footman
			"can't attack Footman and Peasant!"
		else
			enemy.damage(@attack_power)
		end
	end

	def damage(attack_power)
		@health_points -= attack_power
	end



end
