
def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(array)
  total = 0

  array.each {|el| total += el}

  total
end

def multiply(array)
  total = 1

  array.each {|el| total *= el}

  total
end

def power(num, pow)
  num ** pow
end

def factorial(num)

  if num <= 1
    return 1
  else
    return num * factorial(num - 1)
  end

end
