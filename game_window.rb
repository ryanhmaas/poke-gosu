require 'gosu'
require_relative 'character'

class Game < Gosu::Window
  SCREEN_HEIGHT = 800
  SCREEN_WIDTH = 1100

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "Pokemon (WSP Edition)!"
    @character = Character.new
    @background_image = Gosu::Image.new(self, "images/background.png", :tileable => false)
    @large_font = Gosu::Font.new(self, "Early Gameboy", SCREEN_HEIGHT / 20)
  end

  #updates to game window
  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @character.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @character.turn_right
    end
    @character.move_char
  end

  def draw
    @character.draw
    @background_image.draw(0,0,0)
    draw_text(SCREEN_WIDTH/4, SCREEN_HEIGHT/3, "Pokemon - WSP Edition", @large_font, 0xff000000)
  end

  def draw_text(x, y, text, font, color)
    font.draw(text, x, y, 3, 1, 1, color)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

Game.new.show
