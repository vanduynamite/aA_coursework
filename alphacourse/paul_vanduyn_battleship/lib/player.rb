require_relative "board"
require_relative "ship"

class HumanPlayer

  DEFAULT_SHIPS = [
        ['Aircraft Carrier', 5],
        ['Battleship', 4],
        ['Submarine', 3],
        ['Destroyer', 3],
        ['Patrol Boat', 2],
      ] # change for different ships

  attr_reader :name, :board

  def initialize(name = "Player 1", ships = default_ships, board = Board.new)
    @name = name
    @ships = ships
    @board = board
  end

  def default_ships
    DEFAULT_SHIPS.map { |name, size| Ship.new(name, size) }
  end

  def place_ships
    # could improve this by getting choices from the player
    place_ships_randomly
  end

  def place_ships_randomly
    @board.populate_grid(@ships)
  end

  def get_play(board)
    puts "Here's your board that the computer is trying to hit:\n\n"
    @board.display(true)
    puts "\n\n\nHere's the board you are currently guessing on:\n\n"
    board.display(true)
    puts ""
    valid_pos = false
    until valid_pos
      print "Choose a location to attack in the form of x, y: "
      pos = gets.chomp
      if board.valid_pos?([pos[0].to_i, pos[-1].to_i])
        valid_pos = true
      else
        puts "Invalid position!"
      end
    end
    puts "\n\n\n"
    [pos[0].to_i, pos[-1].to_i]
  end

end

# player = HumanPlayer.new("Paul")
# player.place_ships
# player.board.display

class ComputerPlayer

  attr_reader :name, :board

  DEFAULT_SHIPS = [
        ['Aircraft Carrier', 5],
        ['Battleship', 4],
        ['Submarine', 3],
        ['Destroyer', 3],
        ['Patrol Boat', 2],
      ] # change for different ships

  def initialize(name = "Computer", ships = default_ships, board = Board.new)
    @name = name
    @ships = ships
    @board = board
  end

  def default_ships
    DEFAULT_SHIPS.map { |name, size| Ship.new(name, size) }
  end

  def place_ships
    place_ships_randomly
  end

  def place_ships_randomly
    @board.populate_grid(@ships)
  end

  def get_play(board)
    # could improve this by making smarter choices
    # 1. are there any lines of hits that don't end on the edges or misses?
    #    and are also < the remaining ships' lengths?
    # 2. are there any lonely hits? explore in a random direction
    # 3. go diagonally I guess. This one would be hard to implement
    pos = board.rand_pos([:o, :x])
    [pos[0].to_i, pos[-1].to_i]
  end

  def display_board(show_ships = true)
    @board.display(show_ships)
  end

end
