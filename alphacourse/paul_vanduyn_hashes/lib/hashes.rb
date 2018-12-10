# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)

  word_lengths = {}

  str.split.each {|word| word_lengths[word] = word.length}

  word_lengths

end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)

  hash.sort_by {|k, v| v}.last.first

end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)

  newer.each {|k, v| older[k] = v}
  older

end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)

  counts = Hash.new(0)

  word.chars.each {|l| counts[l] += 1}

  counts

end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)

  u_arr = []
  arr.each {|i| u_arr << i unless u_arr.include?(i)}
  u_arr

  # why would i do this with a hash? Seems inefficient
  # uniques = Hash.new("yep")
  # arr.each {|i| uniques[i] = "nope"}
  # uniques.keys

end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)

  counts = numbers.map {|n| n % 2}

  hash = {
    even: counts.count(0),
    odd: counts.count(1),
  }

end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)

  vowel_counts = Hash.new(0)

  string.chars.each {|l| vowel_counts[l] += 1 if 'aeiou'.chars.include?(l)}

  vowel_counts.sort_by {|k, v| v}.last.first

end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)

  later_students = students.select {|k, v| v > 6}.to_a

  pairs = []

  later_students.each_with_index do |p1, i|

    later_students.drop(i + 1).each do |p2, m2|
      pairs << [p1.first, p2]
    end

  end

  pairs

end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)

  hash_counts = Hash.new(0)

  specimens.each {|s| hash_counts[s] += 1}

  arr_counts = hash_counts.sort_by {|k, v| v}

  arr_counts.length ** 2 * arr_counts.first.last / arr_counts.last.last

end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)

  vandal_char_counts = character_count(vandalized_sign)
  normal_char_counts = character_count(normal_sign)

  vandal_char_counts.all? {|k, v| normal_char_counts[k] >= v}

end

def character_count(str)

  counts = Hash.new(0)

  str.delete(" ,.!?\n'").downcase.chars.each {|c| counts[c] += 1}

  counts

end
