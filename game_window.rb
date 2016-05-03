require 'gosu'

class Game < Gosu::Window
  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "Pokemon!"
    @character = Character.new
    @background_image = Gosu::Image.new("media/space.png", :tileable => true)
  end

  #updates to game window
  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @character.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @character.turn_right
    end
    @character.move
  end

  def draw
    @character.draw
    @background_image.draw(0,0,0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

Game.new.show
