class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    self.each { |node| return node.val if node.key == key }
  end

  def include?(key)
    self.each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    prev = @tail.prev
    new_node.next = @tail
    new_node.prev = prev
    @tail.prev = new_node
    prev.next = new_node
  end

  def update(key, val)
    self.each { |node| node.val = val if node.key == key }
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        prev_node = node.prev
        next_node = node.next

        prev_node.next = next_node
        next_node.prev = prev_node
      end
    end
  end

  def each
    curr_node = @head

    until curr_node.next == @tail
      curr_node = curr_node.next
      yield(curr_node)
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
