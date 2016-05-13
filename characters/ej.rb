class EricJohnston < Character
  def initialize
    @spriteArr = Gosu::Image.load_tiles($window, "./images/overworld_sprites.png", 32, 32, false)
    @sprite = @spriteArr[60]
    @x = 0
    @y = 0
    @name = "Eric Johnston"
  end

  def create(bg,src,x,y)
    bg.insert(src,x,y)
    @x = x
    @y = y
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

end
