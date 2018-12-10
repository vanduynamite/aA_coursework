# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  all_nums = (nums.min..nums.max)
  all_nums.reject { |num| nums.include?(num) }
end

# Write a method that returns the nth prime number
def nth_prime(n)

  return nil if n == 0

  current_num = 1
  primes_found = 0
  while primes_found < n
    current_num += 1
    primes_found += 1 if is_prime?(current_num)
  end

  current_num

end

def is_prime?(num)
  return false if num < 2
  (2..num**0.5).none? { |i| num % i == 0 }
end

class Hash
  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)

    new_hash = {}

    self.each { |key, value| new_hash[key] = value if prc.call(key, value) }

    new_hash

  end

end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the length of the longest palindrome in
# a given string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)

  longest = 0

  letters = string.chars

  letters.each_with_index do |char, i|

    (i+2...letters.length).each do |j|
      check = letters[i..j]
      longest = check.length if is_palindrome?(check) && check.length > longest
    end

  end

  longest == 0 ? false : longest

end

def is_palindrome?(string)
  (0...string.length).all? { |i| string[i] == string[string.length - 1 - i] }
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0

    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self

  end
end

class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    a = self.dup
    a.bubble_sort!(&prc)
  end

  # You are not required to implement this; it's here as a suggestion :-)
  # def bubble_sort!(&prc)
  #
  #   prc = Proc.new {|i, j| i <=> j} if prc.nil?
  #
  #   switches = 1
  #
  #   while switches > 0
  #
  #     switches = 0
  #
  #     (0...self.length).each_with_index do |n, i|
  #
  #       if i < self.length - 1 && prc.call(self[i], self[i + 1]) == 1
  #         self[i], self[i + 1] = self[i + 1], self[i]
  #         switches += 1
  #       end
  #
  #     end
  #
  #   end
  #
  #   self
  #
  # end

  ########################################
  ### A much better implementation #######
  ########################################
  def bubble_sort!(&prc)

    prc = Proc.new { |x, y| x <=> y } if prc.nil?

    self.loop_sort_once(&prc) until self.is_sorted?(&prc)

    self

  end

  def loop_sort_once(&prc)
    (0...self.length - 1).each do |i|
      self.switch_elements(i, i + 1) unless yield(self[i], self[i + 1]) == -1
    end
  end

  def switch_elements(i, j)
    self[i], self[i + 1] = self[i + 1], self[i]
  end

  def is_sorted?(&prc)
    (0...self.length - 1).all? { |i| yield(self[i], self[i + 1]) == -1 }
  end
  ########################################
  ########################################

end

# The following is a skeleton of three classes you will be asked to define to
# pass the related specs. Please read the specs carefully to determine the
# functionality and instance variables you should give each class. Show us your
# object-oriented programming skills!

class Cat

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def meow
    'meow'
  end

  def receive_love
    self.meow
  end

end

class Dog
  BREEDS = ['Husky', 'Black Labrador', 'German Shepherd', 'Chihuahua']

  attr_reader :name, :breed
  attr_writer :name

  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def play_with(friend)
    friend.receive_love
  end

  def self.make_a_pup
    Dog.new('unnamed', BREEDS.sample)
  end

end

class Human

  attr_reader :name

  def initialize(name)
    @name = name
    @happy = false
  end

  def happy?
    @happy
  end

  def receive_love
    @happy = true
  end

end
