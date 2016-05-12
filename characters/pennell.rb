class DanPennell < Character
  def initialize(x, y)
    @x = x
    @y = y
  end

  def draw
    @sprite = Gosu::Image.new(self, "images/background.png", :tileable => false)
    @sprite.draw(@x, @y, 5)
  end

end
