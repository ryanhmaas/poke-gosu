require 'gosu'
require_relative 'character'

class Game < Gosu::Window
  SCREEN_HEIGHT = 800
  SCREEN_WIDTH = 1100

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "Pokemon (WSP Edition)!"
    @character = Character.new
    $window = self
    @character = MainCharacter.new(50, 50)
    @background_image = Gosu::Image.new(self, "images/background.png", :tileable => false)
    @large_font = Gosu::Font.new(self, "Early Gameboy", SCREEN_HEIGHT / 20)
  end

  #updates to game window
  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @character.move_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @character.move_right
    end
    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpUp then
      @character.move_up
    end
    if Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpDown then
      @character.move_down
    end
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
    case id
    when Gosu::KbUp
      puts "Up button_down"
    when Gosu::KbDown
      puts "Down button_down"
    when Gosu::KbLeft
      @character.move_left
      puts "LEFT"
    when Gosu::KbRight
      @character.move_right
      puts "RIGHT"
    when Gosu::KbEscape
      close
    end
  end


end

Game.new.show
