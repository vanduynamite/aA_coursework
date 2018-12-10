# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi

  attr_reader :towers

  def initialize(towers = [[3, 2, 1],[],[]])
    @towers = towers
  end

  def play()

    while !won?
      render

      # ask which pile to take from
      print "Which tower to take from? "
      from = gets.chomp.to_i - 1

      # ask which pile to put onto
      print "Which tower to put onto? "
      to = gets.chomp.to_i - 1

      if valid_move?(from, to)
        move(from, to)
      else
        puts "**********That is an invalid move!**********"
      end

    end

    render
    puts "", "", "**********Congratulations, you've won!**********", "", ""

  end

  def move(from_tower, to_tower)
    towers[to_tower] << towers[from_tower].pop
  end

  def valid_move?(from_tower, to_tower)
    @towers[from_tower].length > 0 &&
      (@towers[to_tower].last == nil || @towers[from_tower].last < @towers[to_tower].last)
  end

  def won?
    @towers[0].length == 0 && (
      (@towers[1].length == 0 && @towers[2].length > 0) ||
      (@towers[1].length > 0 && @towers[2].length == 0))
  end

  def render

    puts ""

    max_height = @towers.flatten.length
    adjusted_towers = towers.map do |tower|
      tower.map { |el| el * 2 - 1 }
    end

    (0...max_height).to_a.reverse.each do |i|

      line = ""

      adjusted_towers.each do |tower|
        line += graphic_layer(tower, i)
      end

      puts line

    end

    # puts ""
    puts "  Tower 1    Tower 2    Tower 3  ", ""
  end

  def graphic_layer(tower, index)

    base_width = 11 # make sure this is an odd number

    if tower[index] == nil
      Array.new(base_width, " ").join
    else
      spacing = (base_width - tower[index]) / 2
      exes = tower[index]

      Array.new(spacing, " ").concat(Array.new(exes, "X")).concat(Array.new(spacing, " ")).join
    end

  end


end

print "Do you want to play the game? y/n: "
if gets.chomp == "y"
  print "Great! 3, 4, 5, or 6 discs? "
  num = gets.chomp.to_i
  if num == 3 || num == 4 || num == 5 || num == 6
    towers = [[], [], []]
    towers[0] = (1..num).to_a.reverse
    game = TowersOfHanoi.new(towers)
    game.play
  end
end
