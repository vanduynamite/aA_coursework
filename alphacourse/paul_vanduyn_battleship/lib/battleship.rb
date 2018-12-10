require_relative "board"
require_relative "player"
require_relative "ship"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player = HumanPlayer.new, board = Board.new, computer = ComputerPlayer.new)
    @player = player
    @computer = computer
    @board = board
    @current_player = @player
    # @current_player = rand(2) == 0 ? @player : @computer # for random first player
  end

  def attack(pos)
    @board.empty?(pos) ? @board.mark(pos, :x) : @board.mark(pos, :o)
  end

  def count()
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    attack(@current_player.get_play(@board))
  end

  def play

    @computer.place_ships
    @player.place_ships
    @board = @current_player.board

    until game_over?
      switch_player
      puts "#{@current_player.name}'s turn\n\n"
      play_turn
    end

    puts "Game over! #{@current_player.name} wins!\n"

    puts "Player's board (computer guessing):\n"
    @player.board.display(false)
    puts "\n\nComputer board (player guessing):\n"
    @computer.board.display(false)

  end

  def switch_player
    @board = @current_player.board
    @current_player == @player ? @current_player = @computer : @current_player = @player
  end

end

game = BattleshipGame.new
game.play
