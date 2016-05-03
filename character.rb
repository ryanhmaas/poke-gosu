class Character

  #initialize and set x and y properties
  def initialize
    @image = Gosu::Image.new("path/to/image.bmp")
    @x = @y
  end

  #Change angle as desired
  def turn_left
    @angle -= 4.5
  end

  #Change angle as desired
  def turn_right
    @angle += .4.5
  end

  def move
    @x %= 640
    @y %= 480
  end

  def draw
    #this puts image at center of window
    @image.draw_rot(@x, @y, 1, @angle)
  end

end
