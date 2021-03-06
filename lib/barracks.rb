require 'pry'
class Barracks
	attr_reader :gold, :food, :health_points,:lumber

	def initialize
		@gold = 1000
		@food = 80
    @health_points = 500
    @lumber = 500
	end

  def can_train_footman?
  	food >= 2 && gold >= 135
  end


  def train_footman
  	if can_train_footman?
  		@gold -= 135
  		@food -= 2
  		Footman.new
  	else
  		nil
  	end
  end

  def can_train_peasant?
    food >= 5 && gold >= 90
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    else
      nil
    end
  end

  def can_train_seige_engine?
    food >= 3 && gold >= 200 && lumber >= 60
  end

  def train_seige_engine
    if can_train_seige_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
    else
      nil
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

end
