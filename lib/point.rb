module Geometry
  class Point
    attr_reader :x
    attr_reader :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def self.new_by_array(array)      
      self.new(array[0], array[1])
    end

    def ==(another_point)
      self.x === another_point.x && self.y === another_point.y
    end
  end
end