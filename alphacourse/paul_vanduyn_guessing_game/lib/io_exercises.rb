# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game

  num = rand(99) + 1

  guess = 0
  guesses = 0

  # puts "Welcome to the super fun random number guessing game!"
  # puts "Guess a number between 1 and 100"

  while guess != num

    puts "guess a number"
    guess = gets.chomp.to_i
    guesses += 1

    if guess > num
      # puts "too high"
      puts "#{guess} is too high!"
    elsif guess < num
      # puts "too low"
      puts "#{guess} is too low!"
    elsif guess == num
      # puts "just right! #{num}"
      puts "You found the number #{guess}!"
    end

    # puts guesses

  end

  puts "It took you #{guesses} guesses"
  # puts num

end

def randomize_file()

  puts "Please specify a file to shuffle: "
  filename = gets.chomp

  write = File.new("#{filename[0...-4]}-shuffled.txt", "w")

  File.readlines(filename).shuffle.each { |line| write.puts line }

  write.close

end

# randomize_file
