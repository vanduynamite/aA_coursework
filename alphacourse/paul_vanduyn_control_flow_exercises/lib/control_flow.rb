# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  ('a'..'z').each {|letter| str.delete!(letter)}
  str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  str[((str.length - 1).to_f/2).floor..((str.length - 1).to_f/2).ceil]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  count = 0

  VOWELS.each {|vowel| count += str.count(vowel)}

  count
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)

  if (num == 1)
    return 1
  else
    return num * factorial(num - 1)
  end

end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")

  str = ''

  arr.each_index do |i|
    str += arr[i]

    if i < arr.length - 1
      str += separator
    end

  end

  str

end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)

  new_str = ''

  str.chars.each_with_index do |letter, ind|

    if ind % 2 == 0
      new_str += letter.downcase
    else
      new_str += letter.upcase
    end

  end

  new_str

end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)

  arr = str.split(' ')

  arr.each_index do |i|
    if arr[i].length > 4
      arr[i].reverse!
    end
  end

  arr.join(' ')

end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)

  arr = []

  (1..n).each do |num|
    if num % 15 == 0
      arr.push('fizzbuzz')
    elsif num % 5 == 0
      arr.push('buzz')
    elsif num % 3 == 0
      arr.push('fizz')
    else
      arr.push(num)
    end
  end

  arr

end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)

  new_arr = []

  arr.each {|el| new_arr.unshift(el)}

  new_arr

end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)

  if num < 2
    return false
  elsif num == 2 || num == 3
    return true
  end

  (2..num**0.5).each do |i|

    if num % i == 0
      return false
    end

  end

  return true

end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = []
  (1..num/2).each {|i| arr << i if num % i == 0}
  # it's faster to iterate up to half of num, which is the greatest a factor
  # could be, then put num itself in there
  arr << num
  arr

  # even better
  # (1..num/2).map {|i| i if num % i == 0}.compact << num


end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)

  arr = []

  factors(num).each {|factor| arr << factor if prime?(factor)}

  arr

end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)

  prime_factors(num).count

end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)

  even_odd = []
  arr.each {|num| even_odd << num % 2}
  (0..1).each {|num| return arr[even_odd.index(num)] if even_odd.count(num) == 1}

end
