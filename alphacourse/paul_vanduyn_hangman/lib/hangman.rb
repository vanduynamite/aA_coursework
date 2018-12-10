class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(options = {})

    defaults = {
      guesser: HumanPlayer.new,
      referee: ComputerPlayer.new(File.readlines("lib/dictionary.txt").map { |w| w.chomp }),
      board: "",
    }

    merged_options = defaults.merge(options)

    @guesser = merged_options[:guesser]
    @referee = merged_options[:referee]
    @board = merged_options[:board]

  end

  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board = Array.new(secret_length, "_").join
  end

  def play
    # puts @board
    until @board == @referee.secret_word
      take_turn
    end
    puts "\n", @board
    puts "Hooray!\n"
  end

  def take_turn
    letter = @guesser.guess(@board)
    indices = @referee.check_guess(letter)
    update_board(letter, indices)
    @guesser.handle_response(letter, indices)
  end

  def update_board(letter, indices)
    indices.each { |i| @board[i] = letter }
  end

end

class HumanPlayer

  attr_reader :secret_length, :secret_word

  def initialize
    @secret_word = ""
    @secret_length = 0
  end

  def pick_secret_word
    print "Pick a secret word and enter it here: "
    @secret_word = gets.chomp
    @secret_word.length
  end

  def register_secret_length(length)
    @secret_length = 0
  end

  def check_guess(letter)
    gets.chomp.split(",").map { |el| el.to_i }
  end

  def guess(board)
    puts "\n", board
    print "Guess a letter: "
    gets.chomp
  end

  def handle_response(letter, indices)
    # puts board
  end

end

class ComputerPlayer

  attr_reader :secret_word, :secret_length, :candidate_words

  def initialize(dict)
    @dictionary = dict
    @secret_word = ""
    @secret_length = 0
    @possible_letters = ('a'..'z').to_a
    @candidate_words = dict
  end

  def pick_secret_word
    @secret_word = @dictionary.sample.chomp
    @secret_word.length
  end

  def register_secret_length(length)
    @secret_length = length
    @candidate_words.select! { |word| word.length == length }
  end

  def check_guess(letter, guess = @secret_word)
    guess.chars.map.with_index { |l, i| l == letter ? i : nil }.compact
  end

  def guess(board)

    # I don't believe this is a valid need for my program because I'm already
    # tracking possible letters. In order to make this spec pass, I have to
    # consider a board that has been pre-populated without any ACTUAL guesses
    # having been made.
    board.each { |l| @possible_letters.delete(l) } if board.is_a?(Array)
    # Also haha my board is a string and not an array.
    # Didn't even realize until right now.
    # ***********************************************************************

    all_letters = @candidate_words.join
    p all_letters
    p @candidate_words.length
    highest_count = 0
    best_letter = @possible_letters[0]

    @possible_letters.each do |letter|
      if all_letters.count(letter) > highest_count
        highest_count = all_letters.count(letter)
        best_letter = letter
      end
    end

    @possible_letters.delete(best_letter)

    puts "\n", board
    puts "Computer guesses #{best_letter}"

    best_letter
  end

  def handle_response(letter, indices)

    if indices == []
      @candidate_words.reject! { |word| word.include?(letter) }
    else
      @candidate_words.select! { |word| check_guess(letter, word) == indices }
    end

  end

end

game = Hangman.new # for standard human player, computer ref
# game = Hangman.new(
#   guesser: ComputerPlayer.new(File.readlines("lib/dictionary.txt").map { |w| w.chomp }),
#   referee: HumanPlayer.new)
game.setup
game.play
