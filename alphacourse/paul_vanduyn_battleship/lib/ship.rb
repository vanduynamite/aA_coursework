class Ship

  attr_reader :size, :placed, :destroyed, :location

  def initialize(name, size)
    @name = name
    @size = size
    @destroyed = false
    @placed = false
    @location = []
  end

  def place(board)
    @location.each { |pos| board.mark(pos, :s) }
    @placed = true
  end

  def populate_location(pos, dir)
    @location = []
    @size.times { |i| @location << [pos[0] + dir[0] * i, pos[1] + dir[1] * i] }
  end

  def destroy
    @destroyed = true
  end

end
