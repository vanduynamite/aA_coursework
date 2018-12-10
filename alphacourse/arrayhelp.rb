


got_characters = ['Robb', 'Sansa', 'Arya', 'Bran', 'Rickon']


puts got_characters[0..2], "" # inclusive
puts got_characters[0...2], "" # exclusive
puts got_characters.first, ""
puts got_characters.last, ""

# got_characters.push('Ned')
got_characters << 'Ned'
puts got_characters, ""

a = got_characters.pop
# puts got_characters, ""
# puts a, ""

got_characters.unshift('inserts in the beginning')
# puts got_characters, ""

a = got_characters.shift
# puts got_characters, ""
# puts a, ""

more_houses = got_characters + ['Tyrion', 'Jaime'] # returns a new array
puts more_houses, ''
puts got_characters, ''
got_characters.concat(['Tyrion', 'Jaime']) # adds to this array
puts got_characters, ''

# split and join work the same way as in JS
# str.chars is the equivalent of str.split('')

# length, min, max, count, empty?, include?, index
puts got_characters.length, ""
puts got_characters.min, '' # numeric or alphabetical
puts got_characters.max, '' # numeric or alphabetical
puts got_characters.count('Arya'), ''
puts got_characters.empty?, '' # only true if strictly []
puts got_characters.include?('Tyrion'), ''
puts got_characters.index('Tyrion'), ''

# sort, dangerous: sort!
puts got_characters.sort, ''

# reverse. dangerous: reverse!
puts got_characters.reverse, ''

# uniq. dangerous: uniq!
puts [1, 1, 2, 2, 3, 3, 3, 3, 3, 3].uniq, ''

# rotate, rotate!
puts [3, 4, 5, 1, 2].rotate(3), ''
puts [5, 1, 2, 3, 4].rotate(-4), ''

# flatten, flatten!
puts ['el', ['el2a', 'el2b']].flatten, ''

# compact, compact!
puts [nil, nil, nil, 'the only thing left'].compact, ''

# delete, delete_at
a = [1, 2, 3, 3, 3, 3, 3, 4, 5]
a.delete(3)
puts a, ''
puts [1, 2, 3, 3, 3, 3, 3, 4, 5].delete(3), ''
puts [1, 2, 3, 4, 5].delete_at(0), ''

# take, drop
puts [1, 2, 3, 4, 5].take(2), ''
puts [1, 2, 3, 4, 5].drop(2), ''

##################################################
# Ranges


# a = (0..2) # this is a range variable
#
# puts a, ""
# puts a.to_a, "" # to array
#
# b = ('a'..'z')

# puts b.to_a, ""


##################################################
# strings

str = "Hey "
str << "there, person"

puts str

str = "string"
str2 = "inserted"
str3 = "interpolation"

puts "This #{str} was formed with some parts #{str2}, which is called #{str3}"

# .downcase
# .upcase
# .capitalize
# .swapcase

# delete behaves like a maniac
puts "divisions divide into divisions".delete("di")
