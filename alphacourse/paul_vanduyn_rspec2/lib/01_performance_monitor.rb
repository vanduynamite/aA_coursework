
def measure(num = 1, &prc)

  @start = Time.now

  (1..num).each {prc.call}

  @end = Time.now

  (@end - @start) / num

end
