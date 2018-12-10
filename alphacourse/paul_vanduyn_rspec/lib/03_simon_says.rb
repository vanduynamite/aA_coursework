
def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, times = 2)

  array = []

  (1..times).each {array << str}

  array.join(' ')

end

def start_of_word(str, num_letters)

  str[0...num_letters]

end

def first_word(str)

  str.split(' ')[0]

end

def titleize(str)

  little_words = ['and', 'the', 'over']

  str.split(' ').each_with_index.map do |word, i|

    if little_words.include?(word) && i != 0
      word
    else
      word.capitalize
    end

  end.join(' ')

end
