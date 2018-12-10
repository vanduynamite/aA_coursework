

def procs(var, &prc)

  is_there_a_block_provided = prc.nil?

  prc.call if var

  my_proc = Proc.new {|var| puts var}

  my_proc.call("print this")

end

def procs2(var, prc)

  prc.call if var

end

# procs(true) {puts "this will be called"}
#
# # you can also "pre-wrap" it
# prc = Proc.new {puts "this also will be called"}
# procs2(true, prc)

# also go check out rspec2_iteration


class Array
  # Write an Array method that returns a bubble-sorted copy of an array.
  # Do NOT call the built-in Array#sort method in your implementation.
  def bubble_sort(&prc)
    a = self.dup
    a.bubble_sort!(&prc)
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

    prc = Proc.new { |x, y| x <=> y } if prc.nil?

    self.loop_sort_once(&prc) until self.is_sorted?(&prc)

    self

  end

  def loop_sort_once(&prc)
    (0...self.length - 1).each do |i|
      self[i], self[i + 1] = self[i + 1], self[i] if yield(self[i], self[i + 1]) == 1
    end
  end

  def is_sorted?(&prc)
    (0...self.length - 1).all? { |i| yield(self[i], self[i + 1]) == -1 }
  end

end

array = [4,1,3,2]
p array.bubble_sort
