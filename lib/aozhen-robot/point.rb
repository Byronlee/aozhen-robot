#
# robot location
#   point = Point.new(1,1)
#
class Point

  attr_accessor :x, :y

  def initialize x, y
    @x, @y = x.to_i, y.to_i
  end
end
