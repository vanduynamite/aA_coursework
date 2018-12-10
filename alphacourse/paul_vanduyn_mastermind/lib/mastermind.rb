class Code

  attr_reader :pegs

  # why do I need this thing? what's it supposed to be pointing to?
  PEGS = {
    'r' => :red,
    'g' => :green,
    'y' => :yellow,
    'b' => :blue,
    'p' => :purple,
    'o' => :orange,
  }

  def initialize(pegs_array)
    @pegs = pegs_array
    #RGBYOP
  end

  def self.parse(pegs_string)
    pegs_array = pegs_string.downcase.chars

    raise "invalid pegs" unless pegs_array.all? { |peg| PEGS.include?(peg) }

    Code.new(pegs_array)

  end

  def self.random

    arr = []
    4.times { |i| arr << PEGS.to_a.sample[0] }
    Code.new(arr)

  end

  def exact_matches(guess)

    @pegs.map.with_index { |peg, i| peg == guess[i] ? 1 : 0 }.reduce(:+)

  end

  def near_matches(guess)

    total_similar = PEGS.keys.reduce(0) do |acc, peg|
      acc + [@pegs.count(peg), guess.pegs.count(peg)].min
    end

    total_similar - exact_matches(guess)

  end

  def == (guess)
    return false unless guess.is_a?(Code)
    guess.pegs == @pegs
  end

  def [] (index)
    @pegs[index]
  end

end

class Game
  attr_reader :secret_code

  def initialize(code = Code.random)
    @secret_code = code
    @guess = Code.new('xxxx')
    @guesses = 0

  end

  def get_guess

    puts "Your color options are 'rgbyop'."
    print "Enter your next guess in the form of 'wxyz': "

    input = gets.chomp

    @guess = Code.parse(input)

  end

  def display_matches(guess)

    # seriously these have to be lowercase for the test to pass???
    # you'd think you could do a little extra regex to make that work...
    puts "exact matches: #{@secret_code.exact_matches(guess)}"
    puts "near matches: #{@secret_code.near_matches(guess)}"
    puts ""

  end

  def play

    puts "For debugging purposes: #{@secret_code.pegs}"

    while !over?

      get_guess
      display_matches(@guess)
      @guesses += 1

    end

    print "It's over! You "
    if @secret_code.exact_matches(@guess) == 4
      puts "win!"
    else
      puts "lose!"
    end

  end

  def over?

    @guesses >= 10 || @secret_code.exact_matches(@guess) == 4

  end


end

game = Game.new
puts "Enter 'y' if you want to play. If you play and raise the error on input, rspec will not run. "
game.play if gets.chomp == 'y'
