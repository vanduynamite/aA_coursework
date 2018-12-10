require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_reader :board

  def initialize(player_one = HumanPlayer.new, player_two = ComputerPlayer.new)
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one

    @player_one.mark = :X
    @player_two.mark = :O

  end

  def play_turn

    current_player.display(@board)
    if @board.place_mark(current_player.get_move, current_player.mark)
      switch_players!
    else
      puts "**************Invalid move!**************"
    end

  end

  def current_player
    @current_player
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end

  def play

    while !@board.over?
      play_turn
    end

    @player_one.display(@board)
    p @board.winner

  end


end

game = Game.new
game.play
