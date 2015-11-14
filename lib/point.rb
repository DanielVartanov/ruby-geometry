module Geometry
  class Point < Struct.new(:x, :y)
    def self.new_by_array(array)
      self.new(array[0], array[1])
    end

    def ==(another_point)
      x === another_point.x && y === another_point.y
    end

    def to_vector
      Vector.new(x, y)
    end

    def advance_by(vector)
      Point x + vector.x, y + vector.y
    end
    def distance_to(point)
      x0 = x
      y0 = y
      x1 = point.x
      y1 = point.y
      Math.sqrt((x1-x0)*(x1-x0)+(y1-y0)*(y1-y0))
    end
  end
end

def Point(x, y)
  Geometry::Point.new(x, y)
end
