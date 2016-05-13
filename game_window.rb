require 'gosu'
require_relative 'main_character'
Dir[File.dirname(__FILE__) + '/characters/*.rb'].each {|file| require file }

class Game < Gosu::Window
  # lol constants
  SCREEN_HEIGHT = 800
  SCREEN_WIDTH = 1100
  GAME_LIMIT = 30
  RESTRICTED_X_LEFT = -13
  RESTRICTED_X_RIGHT = 1047

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, false)
    self.caption = "WSP Capture"
    $window = self
    @character = MainCharacter.new(50, 50)
    @background_image = Gosu::Image.new(self, "images/background.png", :tileable => false)
    startMusic
    # create an array to contain each instance of the spawned players
    populateMap
    @score  = 0
    @large_font = Gosu::Font.new(self, "Early Gameboy", SCREEN_HEIGHT / 17)
    @small_font = Gosu::Font.new(self, "Early Gameboy", SCREEN_HEIGHT / 20)
    @font = Gosu::Font.new(18)
  end

  #updates to game window
  def update

    getTimer

    createNPCMap(@actualChars)

    if ((Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft) and canMoveX?(@character.get_x)) then
      @character.move_left
    end
    if ((Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight) and canMoveX?(@character.get_x)) then
      @character.move_right
    end
    if ((Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpUp)) then
      @character.move_up
    end
    if ((Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpDown)) then
      @character.move_down
    end

  end

  def createNPCMap(players)
    obj = {}
    new_array = []
    players.each do |index|
      obj = {:name => index, :x_coord => index.get_x, :y_coord => index.get_y, :velocity_bonus => index.get_velocity_bonus, :saying => index.get_saying, :value => index.value}
      new_array << obj
    end
    detectCollision(@character, new_array)
  end

  def draw

    @character.draw
    @background_image.draw(0,0,0)
    draw_text(750, 95, @score.to_s + " " + "points", @large_font, 0xffff0000)
    draw_text(800, 140, @time.to_s, @small_font, 0xffff0000)
    @actualChars.each do |char|
      @sprite_img = char.get_sprite
      if @sprite_img != nil
        @sprite_img.draw(char.get_x, char.get_y, 5)
        @font.draw(char.get_saying, char.get_x, char.get_y + 64, 3, 1,1, 0xffff0000)
      end
    end

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
  def startMusic
    # @backmusic = Gosu::Song.new(self, "audio/Pokemon Blue-Red - Pallet Town.mp3")
    # @backmusic.play(true)
  end

  private
  def populateMap
    @chars = Character.descendants.sample(5)
    @actualChars = []
    @chars.each do |char|
      @actualChars.push(char.new)
    end
  end

  private
  def detectCollision(mainChar, otherCharacters)
    otherCharacters.each do |player|
      if ((player[:x_coord].between?(mainChar.get_x - 10, mainChar.get_x + 10)) && (player[:y_coord].between?(mainChar.get_y - 10, mainChar.get_y + 10))) then
        puts "hit"
        @score += player[:value]
        mainChar.abduct(player)
      else
        # do nothing
      end
    end
  end

end

Game.new.show
