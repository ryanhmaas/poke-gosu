require_relative 'character'

class ChrisBradley < Character
  attr_accessor :sprite, :velocity_bonus
  def initialize

    @sprite = Gosu::Image.new("./images/ath-bradley.bmp")
    @x = generateRandomXCoord
    @y = generateRandomYCoord
    @value = 40
    @sayings = ["Yo, you want Copper River?", "Can you help with HiLevel?", "I am Frodo Baggins"]
    @velocity_bonus = -4
  end

  def draw
    #bg.insert(src,x,y)
    @sprite.draw(@x,@y,5)
  end

  def get_sprite
    return @sprite
  end

  def get_x
    return @x
  end

  def get_y
    return @y
  end


  def get_name
    return @name
  end

  def generateRandomXCoord
    coordinate = 0
    coordinate = rand(-13..1047)
    return coordinate
  end

  def generateRandomYCoord
    coordinate = 0
    coordinate = rand(0..700)
    return coordinate
  end

  def value
    return @value
  end

  def ending_interaction
    return @sayings.sample(1)
  end

  def get_velocity_bonus
    return @velocity_bonus
  end
end
