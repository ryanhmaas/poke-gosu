class BrianSeidel < Character
  attr_accessor :sprite
  def initialize
    @sprite = Gosu::Image.new("./images/seidel.png")
    @x = generateRandomXCoord
    @y = generateRandomYCoord
    @value = 50
    @sayings = ["", "", ""]
    @velocity_bonus = 5
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
