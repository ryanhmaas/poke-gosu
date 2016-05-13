require_relative 'character'

class ChrisBradley < Character
  def initialize
    puts "Initializing Person instance #{object_id}"
    @sprite = Gosu::Image.new("./images/ath-bradley.bmp")
    @x = 0
    @y = 0
    @name = "Chris Bradley"
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
