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
  end
end

def Point(x, y)
  Geometry::Point.new(x, y)
end
