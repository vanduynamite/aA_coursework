
class ComputerPlayer

  attr_reader :board, :name
  attr_accessor :mark

  def initialize(name="Hal")
    @name = name
    @board = nil
    @mark = nil
  end

  def display(board)
    @board = board
  end

  def get_move

    (0..2).each do |i|

      (0..2).each do |j|

        # deep copy for the lose
        test_board = Board.new(Marshal.load(Marshal.dump(@board.grid)))

        test_board.place_mark([i, j], @mark)

        return [i, j] if test_board.winner

      end

    end

    @board.grid.map.with_index do |row, i|
      row.map.with_index { |el, j| el.nil? ? [i, j] : nil }
    end.flatten(1).compact.sample

  end

end
