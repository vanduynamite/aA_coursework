require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)

  arr.reduce(0, :+)

end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)

  long_strings.all? {|str| str.include?(substring)}

end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)

  string.delete(' ').chars.select {|i| string.delete(i).length < string.length - 1}.uniq.sort

end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)

  words = string.split.sort_by {|word| word.length}.reverse[0..1]

end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)

  all_letters = ('a'..'z').to_a

  all_letters.reject {|i| string.include?(i)}

end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)

  (first_yr..last_yr).to_a.select {|year| no_repeat_digits?(year)}

end

def no_repeat_digits?(year)
  year.to_s.chars.none? {|i| year.to_s.count(i) > 1}
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)

  hits = songs.map.with_index {|song, i| song if song == songs[i + 1]}.compact.uniq

  songs.reject {|song| hits.include?(song)}.uniq

end

def no_repeats?(song_name, songs)
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)

  words = string.delete('.,!?').split

  words.select! {|word| word.include?('c')}

  return '' if words == []

  words.sort_by! {|word| word.reverse.index('c')}[0]

end


# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)

  repeats = []
  cur_run = 0

  arr.each_with_index do |n, i|

    if n == arr[i + 1]
      cur_run += 1
    else

      if cur_run > 0
        repeats << [i - cur_run, i]
      end

      cur_run = 0

    end

  end

  repeats

end
