module Geometry
  class Segment
    attr_accessor :point1
    attr_accessor :point2
    
    def initialize(point1, point2)
      @point1 = point1
      @point2 = point2
    end
    
    def self.new_by_arrays(point1_coordinates, point2_coordinates)
      self.new(Point.new_by_array(point1_coordinates), 
               Point.new_by_array(point2_coordinates))
    end
 
    def contains_point?(point)      
      Geometry.distance(@point1, @point2) ===
        Geometry.distance(@point1, point) + Geometry.distance(point, @point2)
    end

    def parallel_to?(segment)
      self.to_vector.collinear_with?(segment.to_vector)
    end

    def intersects_with?(segment)
      self.in_bounds_of?(segment) && segment.in_bounds_of?(self)
    end

    def length
      Geometry.distance(@point1, @point2)
    end

    def to_vector
      Vector.new(@point2.x - @point1.x, @point2.y - @point1.y)
    end

  protected

    # Returns true if lays on line, intersecting with given segment
    def in_bounds_of?(segment)
      vector_to_first_endpoint = Segment.new(@point1, segment.point1).to_vector
      vector_to_second_endpoint = Segment.new(@point1, segment.point2).to_vector

      #FIXME: '>=' method of Fixnum and Float should be overriden too (take precision into account)
      # there is rare case, when this is wrong due to precision
      self.to_vector.cross_product(vector_to_first_endpoint) *
        self.to_vector.cross_product(vector_to_second_endpoint) <= 0
    end
  end
end