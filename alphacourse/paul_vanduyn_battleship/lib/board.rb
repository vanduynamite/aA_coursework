class Board
  GRAPHICS = {
    s: "s",
    x: "x",
    o: "o",
    nil => ".",
    sp: "   ",
    line: "\n"
  }

  attr_reader :grid
  GRID_SIZE = 10 # change for different grid sizes

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid

    Array.new(GRID_SIZE) { Array.new(GRID_SIZE) }
  end

  def populate_grid(ships)
    ships.shuffle.each { |ship| place_ship(ship) }
  end

  def place_ship(ship)
    until ship.placed
      ship.populate_location(rand_pos, rand_dir)
      ship.place(self) if valid_ship_loc?(ship)
    end
  end

  def valid_ship_loc?(ship)
    ship.location.all? do |pos|
      if pos[0] < 0 || pos[1] < 0 || pos[0] > grid.length - 1 || pos[1] > grid.length - 1
        false
      else
        empty?(pos)
      end
    end
  end

  def count()
    @grid.flatten.count - @grid.flatten.count(nil)
  end

  def empty?(pos = nil)
    if pos.nil?
      @grid.all? { |row| row.all? { |el| el.nil? } }
    else
      self[pos].nil?
    end
  end

  def valid_pos?(pos)
    if pos[0] < 0 || pos[0] >= GRID_SIZE || pos[1] < 0 || pos[1] >= GRID_SIZE
      return false
    else
      self[pos] != :x && self[pos] != :o
    end
  end

  def full?
    @grid.all? { |row| row.all? { |el| !el.nil? } }
  end

  def place_random_ship(pos = rand_pos)
    raise "board is full!" if full?
    mark(pos, :s)
  end

  def rand_pos(del_symbols = [:s, :x, :o])
    flattened = @grid.flatten
    del_symbols.each { |sym| flattened.delete(sym)}
    absolute_pos = rand(flattened.count)
    pos = []
    @grid.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if !del_symbols.include?(el)
          pos = [i,j] if absolute_pos == 0
          absolute_pos -= 1 if !del_symbols.include?(el)
        end
      end
    end

    pos
  end

  def rand_dir
    a = rand(2)
    b = rand(2)
    [(a - 1) * (-1) ** b, a * (-1) ** b]
  end

  def won?
    @grid.flatten.count(:s) == 0
  end

  def [] (pos)
    @grid[pos[0]][pos[1]]
  end

  def mark(pos, symbol)
    @grid[pos[0]][pos[1]] = symbol
  end

  def display(show_ships = false)

    show_ships ? GRAPHICS[:s] = "s" : GRAPHICS[:s] = GRAPHICS[nil]

    print " ", GRAPHICS[:sp]
    @grid.length.times do |i|
      print GRAPHICS[:sp], i
    end

    print GRAPHICS[:line]

    @grid.each_with_index do |row, i|
      print GRAPHICS[:line], GRAPHICS[:sp], i
      row.each do |el|
        print GRAPHICS[:sp], GRAPHICS[el]
      end
      print GRAPHICS[:line]
    end
  end

end
