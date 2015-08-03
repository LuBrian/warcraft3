require 'pry'
class Unit
	attr_reader :health_points,:attack_power

  def initialize(health_points,attack_power)
    @health_points = health_points
  	@attack_power = attack_power
  end

  def attack!(enemy_unit)
    if dead?
      "Dead unit can't attack other alive unit!"
    elsif enemy_unit.health_points <= 0 
      "This unit is dead, alive unit can't dead unit!"
    else
      enemy_unit.damage(@attack_power)
    end
  end
  
  def damage(attack_power)
    
    if dead?
      "this unit is dead!"
    else
      binding.pry
      @health_points -= attack_power
    end
    
  end

  def dead?
    @health_points <= 1
  end



end