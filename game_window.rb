require 'gosu'
require_relative 'main_character'
Dir[File.dirname(__FILE__) + '/characters/*.rb'].each {|file| require file }

class Game < Gosu::Window
  SCREEN_HEIGHT = 800
  SCREEN_WIDTH = 1100
  RESTRICTED_X_LEFT = -13
  RESTRICTED_X_RIGHT = 1047
  RESTRICTED_Y_TOP = 0
  RESTRICTED_Y_BOTTOM = 700

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "WSP Capture"
    $window = self
    @character = MainCharacter.new(50, 50)
    @background_image = Gosu::Image.new(self, "images/background.png", :tileable => false)
    @backmusic = Gosu::Song.new(self, "audio/Pokemon Blue-Red - Pallet Town.mp3")
    @backmusic.play(true)

    @chars = Character.descendants.sample(5)
    @chars.each do |char|
      @char = char.new
      @char.create(@char.get_sprite, generateRandomXCoord, generateRandomYCoord)
    end
  end

  #updates to game window
  def update
    if ((Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft) and canMoveX?(@character.get_x)) then
      @character.move_left
    end
    if ((Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight) and canMoveX?(@character.get_x)) then
      @character.move_right
    end
    if ((Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpUp) and canMoveY?(@character.get_y)) then
      @character.move_up
    end
    if ((Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpDown) and canMoveY?(@character.get_y)) then
      @character.move_down
    end
  end

  def draw
    @character.draw
    @background_image.draw(0,0,0)
    @chars.each do |char|

    end
  end

  def button_down(id)
    case id
    when Gosu::KbUp
    when Gosu::KbDown
    when Gosu::KbLeft
      @character.move_left
    when Gosu::KbRight
      @character.move_right
    when Gosu::KbEscape
      close
    end
  end


  def generateRandomXCoord
    coordinate = 0
    coordinate = rand(RESTRICTED_X_LEFT..RESTRICTED_X_RIGHT)
    puts "X: " + coordinate.to_s
    return coordinate
  end

  def generateRandomYCoord
    coordinate = 0
    coordinate = rand(RESTRICTED_Y_TOP..RESTRICTED_Y_BOTTOM)
    puts "Y: " + coordinate.to_s
    return coordinate
  end

  private
  def canMoveX?(coordinate)
    if (coordinate < RESTRICTED_X_LEFT || coordinate > RESTRICTED_X_RIGHT) then
      return false
    else
      return true
    end
  end

  private
  def canMoveY?(coordinate)
    if (coordinate < RESTRICTED_Y_TOP) then
      puts "STOP: Coordinate is " + coordinate.to_s
      puts "STOP: Top is " + RESTRICTED_Y_TOP.to_s
      return false
    elsif (coordinate > RESTRICTED_Y_BOTTOM) then
      return false
    else
      puts "Coordinate is " + coordinate.to_s
      puts "Top is " + RESTRICTED_Y_TOP.to_s
      return true
    end
  end


end

Game.new.show
