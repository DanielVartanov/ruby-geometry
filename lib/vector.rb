module Geometry
  class Vector
    attr_reader :x
    attr_reader :y

    def initialize(x, y)
      @x = x
      @y = y
    end
    
    def collinear_with?(vector)
      @x.to_f / vector.x === @y.to_f / vector.y
    end
  end
end