class DanPennell < Character
  def initialize
    @spriteArr = Gosu::Image.load_tiles($window, "./images/overworld_sprites.png", 32, 32, false)
    @sprite = @spriteArr[60]
    @x = 0
    @y = 0
  end

  def create(src,x,y)
    @sprite.insert(src,x,y)
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

end
