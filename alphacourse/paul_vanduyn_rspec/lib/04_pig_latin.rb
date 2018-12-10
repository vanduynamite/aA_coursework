
def translate(str)

  str.split(' ').map {|word| translate_single_word(word)}.join(' ')

end

def translate_single_word(word)

  i = 0

  while !'aeiou'.include?(word[i].downcase) ||
    (word[i].downcase == 'u' && word[i - 1].downcase == 'q' && i > 0)

    i += 1
  end

  word[i..word.length] + word[0...i] + "ay"

end
