
class KnightPathFinder
  attr_accessor :visited_positions, :root_node, :parent


  def initialize(root_node)
    @root_node = root_node
    @visited_positions = [root_node]
    build_move_tree
  end

  # def bfs(target_value)
  #   arr = [self]
  #
  #   until arr.empty?
  #     check_node = arr.shift
  #     arr += check_node.children
  #     return check_node if check_node.value == target_value
  #   end
  #
  #   nil
  # end

  # def parent=(new_parent_node) # same as calling self.parent = something
  #
  #   remove_child_from_old_parent
  #
  #   if new_parent_node == nil
  #     # simply 'parent = nil' creates a new LOCAL variable called parent
  #     # 'self.parent = nil' would recurse because it recalls this method
  #     # so exactly '@parent = nil' is correct
  #     @parent = nil
  #   else
  #     @parent = new_parent_node
  #
  #     new_parent_node.children << self unless new_parent_node.children.include?(self)
  #   end
  # end



  def build_move_tree
    arr = [root_node]
    nodes = []

    until arr.empty?
      this_pos = arr.shift
      arr += new_move_positions(this_pos)
      nodes << PolyTreeNode.new(this_pos)
    end

    nodes
  end

  def new_move_positions(start_pos)
    possible_positions = KnightPathFinder.valid_moves(start_pos)

    possible_positions.reject { |pos| visited_positions.include?(pos) }

    self.visited_positions += possible_positions

    possible_positions

    # positions_moved_to = []
    #
    # i = 0
    # while i < possible_positions.length
    #
    #   unless visited_positions.include?(possible_positions[i])
    #     visited_positions << possible_positions[i]
    #     positions_moved_to << possible_positions[i]
    #   end
    #   i += 1
    # end
    #
    # positions_moved_to

  end

  def self.valid_moves(start_pos)

    possible_positions = []

    start_x = start_pos[0]
    start_y = start_pos[1]

    (start_x - 2..start_x + 2).each do |x|
      (start_y - 2..start_y + 2).each do |y|

        if (x != start_x) && (y != start_y) && (start_x - x).abs != (start_y - y).abs && (x >= 0) && (y >= 0) && (x < 8) && (y < 8)
          possible_positions << [x, y]
        end
      end
    end

    possible_positions

  end

  def find_path

  end

end

class PolyTreeNode

  attr_writer :value, :children

  def initialize(value)
    @value = value
    @parent = nil # the single node above me
    @children = [] # nodes under me
  end

  def dfs(target_value)
    # debugger
    # check current node and return current node if true
    # else loop through children array and call dfs on it
    # base: return current node if it's equal to the target value
    return self if value == target_value

    # passed = children.each { |child| child.dfs(target_value)}
    # passed

    children.each do |child|
      passed = child.dfs(target_value)
      return passed unless passed.nil?
    end
    nil
  end

  def bfs(target_value)
    arr = [self]

    until arr.empty?
      check_node = arr.shift
      arr += check_node.children
      return check_node if check_node.value == target_value
    end

    nil
  end



  def parent=(new_parent_node) # same as calling self.parent = something

    remove_child_from_old_parent

    if new_parent_node == nil
      # simply 'parent = nil' creates a new LOCAL variable called parent
      # 'self.parent = nil' would recurse because it recalls this method
      # so exactly '@parent = nil' is correct
      @parent = nil
    else
      @parent = new_parent_node

      new_parent_node.children << self unless new_parent_node.children.include?(self)
    end
  end

  def add_child(new_child_node)
    # a new kid just moved into my house

    children << new_child_node # now the kid lives here
    new_child_node.parent = self # this tells the kid that it now lives here
  end

  def remove_child(child_to_delete)
    # a kid is moving out of the house
    raise "You don't live here!" unless children.include?(child_to_delete) # what if this kid doesn't live here???

    children.delete(child_to_delete) # remove the child from my house (my children array)
    child_to_delete.parent = nil # let the child know it doesn't live here
  end

  def remove_child_from_old_parent
    parent.children.delete(self) unless parent == nil
  end

  # same as calling self.parent, or Node.parent
  # OR, WITHIN THIS INSTANCE, same as simply 'parent'
  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([0, 0])
  kpf.find_path([2, 1])
end
