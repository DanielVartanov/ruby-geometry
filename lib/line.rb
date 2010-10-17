module Geometry
  class Line < Struct.new(:point1, :point2)
    def self.new_by_arrays(point1_coordinates, point2_coordinates)
      self.new(Point.new_by_array(point1_coordinates), 
               Point.new_by_array(point2_coordinates))
    end

    def slope
      dy = Float(point2.y - point1.y)
      dx = Float(point2.x - point1.x)

      return 0.0 if dy == 0

      dy / dx
    end

    def y_intercept
      return nil if vertical?

      # compute change in y between point1 and the origin
      dy = point1.x * slope
      point1.y - dy
    end

    def x_intercept
      return nil if horizontal?

      # compute change in x between point1 and the origin
      dx = point1.y / slope
      point1.x - dx
    end

    def parallel_to?(other)
      # Special handling for when one slope is inf and the other is -inf:
      return true if slope.infinite? and other.slope.infinite?

      slope == other.slope
    end
    
    def vertical?
      if slope.infinite?
        return true
      else
        return false
      end
    end

    def horizontal?
      slope == 0
    end

    def intersect_x(other)
      if vertical? and other.vertical?
        if x_intercept == other.x_intercept
          return x_intercept
        else
          return nil
        end
      end

      return nil if horizontal? and other.horizontal?

      return x_intercept if vertical?
      return other.x_intercept if other.vertical?

      d_intercept = other.y_intercept - y_intercept
      d_slope = slope - other.slope

      # if d_intercept and d_slope are both 0, the result is NaN, which indicates
      # the lines are identical
      d_intercept / d_slope
    end

    def angle_to(other)
      # return absolute difference between angles to horizontal of self and other
      sa = Math::atan(slope)
      oa = Math::atan(other.slope)
      (sa-oa).abs
    end
  end
end
