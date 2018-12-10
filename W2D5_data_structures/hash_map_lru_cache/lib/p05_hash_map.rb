require_relative 'p03_hash_set'
require_relative 'p04_linked_list'


class HashMap < HashSet
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def set(key, val)
    @store[bucket(key)].append(key, val)
  end

  def get(key)
  end

  def delete(key)
  end

  def each
    @store.each do |linklist|
      linklist.each do |node|
        yield(node)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def resize!
  end

  def bucket(key)
    key.hash % num_buckets
  end

end
