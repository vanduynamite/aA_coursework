require_relative "p01_int_set"

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    super(num_buckets)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

end
