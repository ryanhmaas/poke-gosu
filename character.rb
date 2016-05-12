class Character

  #initialize and set x and y properties
  def initialize
    @image = Gosu::Image.new("images/8bitcharles.png")
    @x = @y
  end

  #Change angle as desired
  def turn_left
    @angle -= 4.5
  end

  #Change angle as desired
  def turn_right
    @angle += 4.5
  end

  def move_char
  end

  def draw
    #this puts image at center of window
    @image.draw_rot(1, 1, 1, 1)
  end

end
