class MyHashSet

  attr_accessor :store

  def initialize()
    @store = {}
  end

  def insert(val)

    @store[val] = true

  end

  def delete(val)

    @store.delete(val)

  end

  def include?(val)

    @store.include?(val)

  end

  def to_a

    @store.map { |k, v| k }

  end

  def union(hash_set)

    union_set = MyHashSet.new

    self.to_a.concat(hash_set.to_a).uniq.each { |k| union_set.insert(k) }

    union_set

  end

  def intersect(hash_set)

    intersect_set = MyHashSet.new

    @store.each { |k, v| intersect_set.insert(k) if hash_set.include?(k) }

    intersect_set

  end

  def minus(hash_set)

    minus_set = MyHashSet.new

    @store.each { |k, v| minus_set.insert(k) unless hash_set.include?(k) }

    minus_set

  end

end
