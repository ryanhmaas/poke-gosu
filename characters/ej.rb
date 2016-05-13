class EricJohnston < Character
  attr_accessor :sprite
  def initialize
    @sprite = Gosu::Image.new("./images/archie-ej.png")
    @x = generateRandomXCoord
    @y = generateRandomYCoord
    @value = 40
    @sayings = ["", "", ""]
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

end
