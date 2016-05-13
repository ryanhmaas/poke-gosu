require 'gosu'
require_relative 'main_character'
Dir[File.dirname(__FILE__) + '/characters/*.rb'].each {|file| require file }

class Game < Gosu::Window
  # lol constants
  SCREEN_HEIGHT = 800
  SCREEN_WIDTH = 1100
  GAME_LIMIT = 300
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
    @large_font = Gosu::Font.new(self, "Early Gameboy", SCREEN_HEIGHT / 10)
    @backmusic = Gosu::Song.new(self, "audio/Pokemon Blue-Red - Pallet Town.mp3")
    @backmusic.play(true)

    secondary_characters_array = Array.new
    @chars = Character.descendants.sample(5)
    @chars.each do |char|
      @char = char.new
      @background_image.insert(@char.get_sprite, generateRandomXCoord, generateRandomYCoord)
      secondary_characters_array.push(@char)
    end

    @large_font = Gosu::Font.new(self, "Early Gameboy", SCREEN_HEIGHT / 10)

    assignCollisionMap(@character, secondary_characters_array)
  end

  #updates to game window
  def update

    getTimer

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
    draw_text(875, 95, @time.to_s, @large_font, 0xffff0000)
  end

  def draw_text(x, y, text, font, color)
    font.draw(text, x, y, 3, 1, 1, color)
  end

  private
  def getTimer
    # increments the counter every second
    @time = Gosu.milliseconds/1000
    if @time > GAME_LIMIT then
      # destroy timer object becoause game is over
      @time = nil
      @background_image = Gosu::Image.new(self, "images/game_over.png", false)
    end
  end

  private
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
    return coordinate
  end

  def generateRandomYCoord
    coordinate = 0
    coordinate = rand(RESTRICTED_Y_TOP..RESTRICTED_Y_BOTTOM)
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
    if (coordinate < RESTRICTED_Y_TOP || coordinate > RESTRICTED_Y_BOTTOM) then
      return false
    else
      return true
    end
  end

  private
  def assignCollisionMap(mainChar, *otherCharacters)
    otherCharacters.each_index do |otherChars|
      # puts otherChars.get_x
    end
  end


end

Game.new.show
