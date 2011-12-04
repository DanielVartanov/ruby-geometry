module Geometry
  class Point < Struct.new(:x, :y)
    def self.new_by_array(array)      
      self.new(array[0], array[1])
    end

    def ==(another_point)
      x === another_point.x && y === another_point.y
    end
  end
end

def Point(x, y)
  Geometry::Point.new(x, y)
end
