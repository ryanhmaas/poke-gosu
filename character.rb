class Character

  #initialize and set x and y properties
  def initialize(image, x, y)
    @image = Gosu::Image.new(image)
    @x      = x
    @y      = y
    @move_x = 0
    @move_y = 0
    @moving = false
  end

  def draw
    #this puts image at center of window
    @image.draw(@x, @y, 5)
  end

  def update
    if @moving then
      if @move_x > 0 then
        @move_x -= 1
        @x += 1
      elsif @move_x < 0 then
        @move_x += 1
        @x -= 1
      elsif @move_x == 0 then
        @moving = false
      end

      if @move_y > 0 then
        @move_y -= 1
        @y += 1
      elsif @move_y < 0 then
        @move_y += 1
        @y -= 1
      elsif @move_y == 0 then
        @moving = false
      end
    end
  end

  def move_left
    @move_x -= 50
    @moving = true
  end

  def move_right
    @move_x += 50
    @moving = true
  end

  def move_up
    @y -= 50
    @moving = true
  end

  def move_down
    @y += 50
    @moving = true
  end
end
