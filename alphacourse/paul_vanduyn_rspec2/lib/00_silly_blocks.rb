
# reverses each word of the sentence individually
def reverser(&prc)

  prc.call.split.map {|word| word.reverse}.join(' ')

end

def adder(num = 1, &prc)

  num + prc.call

end

def repeater(num = 1, &prc)

  (1..num).each {prc.call}

end
