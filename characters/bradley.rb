require_relative 'character'

class ChrisBradley < Character
  def initialize
    puts "Initializing Person instance #{object_id}"
    @sprite = Gosu::Image.new("./images/8bitcharles.png")
  end

  def create(src,x,y)
    @sprite.insert(src,x,y)
  end

  def get_sprite
    return @sprite
  end

end
