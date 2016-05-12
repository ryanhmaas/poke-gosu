require 'gosu'
require_relative 'character'

class Game < Gosu::Window
  SCREEN_HEIGHT = 1000
  SCREEN_WIDTH = 1000

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "Pokemon!"
    $window = self
    @character = MainCharacter.new(50, 50)
    @background_image = Gosu::Image.new("images/bg-start.jpg", :tileable => true)
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
