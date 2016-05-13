class CharlesTennent < Character

  def initialize
    @sprite = Gosu::Image.new("./images/hiker-charles.png")
    @x = generateRandomXCoord
    @y = generateRandomYCoord
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

end
