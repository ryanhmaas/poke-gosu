class MainCharacter
  #initialize and set x and y properties
  def initialize(x, y)
    @spriteArr = Gosu::Image.load_tiles($window, "images/red.png", 64, 64, false)
    @sprite = @spriteArr[0]
    #location properties

    #these two hold bottom of sprite
    @real_x = x
    @real_y = y

    #these two hold bottom of player/gravity/wtf it is
    @x      = @real_x + (@sprite.width/2)
    @y      = @real_y + @sprite.height
    @move_x = 0
    @move_y = 0
    @moving = false
    @velocity = 5
    @text = Gosu::Font.new(18)
  end

  def draw
    #this puts image at center of window
    @sprite.draw(@x, @y, 5)
  end

  def update
    if @moving then
      if (@move_x > 0) then
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
    @sprite = @spriteArr[4]
    @x -= @velocity
    @moving = true
  end

  def move_right
    @sprite = @spriteArr[8]
    @x += @velocity
    @moving = true
  end

  def move_up
    @sprite = @spriteArr[12]
    @y -= @velocity
    @moving = true
  end

  def move_down
    @sprite = @spriteArr[0]
    @y += @velocity
    @moving = true
  end

  def get_x
    return @x
  end

  def get_y
    return @y
  end

  def abduct(person)
    #code to remove person from board and gain attribute
    if((@velocity + @velocity + person[:velocity_bonus]) < 20) then
      @velocity += person[:velocity_bonus]
    end
    person[:name].value = 0
    person[:name].sprite = nil
  end

  #contains players score
  def get_score
    return @score
  end
end
