class CharlesTennent < Character
  attr_accessor :sprite, :velocity_bonus, :text, :saying, :value

  def initialize
    @sprite = Gosu::Image.new("./images/hiker-charles.png")
    @x = generateRandomXCoord
    @y = generateRandomYCoord
    @value = 20
    @saying = ["*humming intensifies*", "Your eye good, Hunter?"].sample(1)
    @velocity_bonus = 1
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

  def set_value(value)
    @value = value
  end

  def ending_interaction
    return @sayings.sample(1)
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
