class BrianSeidel < Character
  def initialize
    @spriteArr = Gosu::Image.load_tiles($window, "./images/overworld_sprites.png", 32, 32, false)
    @sprite = @spriteArr[60]
    @value = 12
  end

  def create(src,x,y)
    @sprite.insert(src,x,y)
  end

  def get_sprite
    return @sprite
  end

end
