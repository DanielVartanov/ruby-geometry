module Geometry
  class SegmentsDoNotIntersect < Exception; end
  class SegmentsOverlap < Exception; end
  
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
    
    def intersection_point_with(segment)
      raise SegmentsDoNotIntersect unless self.intersects_with?(segment)
      raise SegmentsOverlap if self.intersects_with?(segment) && self.parallel_to?(segment)
      
      numerator = (segment.point1.y - self.point1.y) * (segment.point1.x - segment.point2.x) -
        (segment.point1.y - segment.point2.y) * (segment.point1.x - self.point1.x);
      denominator = (self.point2.y - self.point1.y) * (segment.point1.x - segment.point2.x) - 
        (segment.point1.y - segment.point2.y) * (self.point2.x - self.point1.x);

      t = numerator.to_f / denominator;
      
      x = self.point1.x + t * (self.point2.x - self.point1.x)
      y = self.point1.y + t * (self.point2.y - self.point1.y)            
      
      Point.new(x, y)
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

      #FIXME: '>=' and '<=' method of Fixnum and Float should be overriden too (take precision into account)
      # there is a rare case, when this method is wrong due to precision
      self.to_vector.cross_product(vector_to_first_endpoint) *
        self.to_vector.cross_product(vector_to_second_endpoint) <= 0
    end
  end
end