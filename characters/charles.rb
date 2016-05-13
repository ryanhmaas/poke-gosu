class CharlesTennent < Character
  def initialize
    @sprite = Gosu::Image.new("./images/8bitcharles.png")
  end

  def create(src,x,y)
    $window.background_image.insert(src,x,y)
  end

  def get_sprite
    return @sprite
  end
end
