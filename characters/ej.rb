class EricJohnston < Character
  attr_accessor :sprite, :velocity_bonus, :text
  def initialize
    @sprite = Gosu::Image.new("./images/archie-ej.png")
    @x = generateRandomXCoord
    @y = generateRandomYCoord
    @value = 40
    @saying = ["", "", ""].sample(1)
    @velocity_bonus = 10
    @text = Gosu::Font.new(18)
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

  def get_saying
    return @saying
  end

  def get_velocity_bonus
    return @velocity_bonus
  end

  def get_text
    return @text
  end
end
