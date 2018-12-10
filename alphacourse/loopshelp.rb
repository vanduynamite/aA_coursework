
def while_loop

  a = 0

  while a < 100

    puts a

    if a == 5
      return a
    end

    a += 1

  end

end

def iterators

  a = (1..5).to_a

  puts "our array is #{a}", ''

  puts 'each'
  a.each {|val| puts val}

  puts '', 'I guess there is a for loop but no one uses it?'
  for val in a
    puts val
  end

  puts '', 'each index'
  b = a.each_index {|ind| puts ind}
  puts '', b

  puts '', 'each_with_index (ind, val)'

  a.each_with_index {|val, ind| puts ind, val, ''}


  a.each do |val|
    puts "do something with #{val}"
  end

  str = 'abcdef'
  puts '', "and how about a string: #{str}", '', 'each_char'
  str.each_char do |char|
    puts char
  end

  puts "This is kind of cool, a super simple way to call a single function in a block"
  puts "You don't have to declare the variable or call it again"
  puts ['a', 'b', 'c'].map(&:upcase)

end




# while_loop
iterators
