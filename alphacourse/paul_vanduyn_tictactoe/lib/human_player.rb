
class HumanPlayer

  attr_reader :name
  attr_accessor :mark

  def initialize(name = "Paul")
    @name = name
    @mark = nil
  end

  def get_move
    print "Choose where to place your mark. Use the format 'x,y': "
    pos = gets.chomp
    [pos[0].to_i, pos[-1].to_i]
  end

  def display(board)
    blank_line = "     |     |     "
    floor_line = "_____|_____|_____"
    first_line = build_line(board.grid[0])
    second_line = build_line(board.grid[1])
    third_line = build_line(board.grid[2])


    puts "", ""
    puts blank_line, first_line, floor_line
    puts blank_line, second_line, floor_line
    puts blank_line, third_line, blank_line

  end

  private
  def build_line(row)
    line = ""
    line += "  "
    line += get_char(row[0])
    line += "  |  "
    line += get_char(row[1])
    line += "  |  "
    line += get_char(row[2])
    line += "  "
  end

  private
  def get_char(el)

    case el
    when nil
      " "
    when :X
      "X"
    when :O
      "O"
    else
      " "
    end

  end

end
