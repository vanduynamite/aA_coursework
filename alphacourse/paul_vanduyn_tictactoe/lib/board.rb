
class Board

  attr_reader :grid

  # this won't work! look at these dumb not-orange nils!
  def initialize(grid = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]])
    @grid = grid
  end

  def place_mark(pos, mark)
    empty?(pos) ? @grid[pos[0]][pos[1]] = mark : false
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]] == nil
  end

  def over?
    @grid.flatten.compact.length == 9 || winner != nil
  end

  def winner(test_grid = @grid)

    parts = get_parts(test_grid)

    parts.map! { |row| row.uniq.length == 1 ? row.uniq[0] : nil }.uniq!.compact! << nil

    parts[0]

  end

  def get_parts(test_grid)

    # initialize this with two empty arrays that will represent the diagonals
    parts = [[], []]

    # can build all 8 cases with one loop!
    (0..2).each do |i|

      parts << test_grid[i]
      parts << test_grid.map { |row| row[i] }
      parts[0] << test_grid[i][i]
      parts[1] << test_grid[test_grid.length - 1 - i][i]

    end

    parts

  end

end
