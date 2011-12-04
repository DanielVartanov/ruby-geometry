module Geometry
  class SegmentsDoNotIntersect < Exception; end
  class SegmentsOverlap < Exception; end
  
  class Segment < Struct.new(:point1, :point2)
    def self.new_by_arrays(point1_coordinates, point2_coordinates)
      self.new(Point.new_by_array(point1_coordinates), 
               Point.new_by_array(point2_coordinates))
    end

    def leftmost_endpoint
      ((point1.x <=> point2.x) == -1) ? point1 : point2
    end

    def rightmost_endpoint
      ((point1.x <=> point2.x) == 1) ? point1 : point2
    end

    def topmost_endpoint
      ((point1.y <=> point2.y) == 1) ? point1 : point2
    end

    def bottommost_endpoint
      ((point1.y <=> point2.y) == -1) ? point1 : point2
    end
 
    def contains_point?(point)      
      Geometry.distance(point1, point2) ===
        Geometry.distance(point1, point) + Geometry.distance(point, point2)
    end

    def parallel_to?(segment)
      to_vector.collinear_with?(segment.to_vector)
    end

    def lies_on_one_line_with?(segment)
      Segment.new(point1, segment.point1).parallel_to?(self) &&
        Segment.new(point1, segment.point2).parallel_to?(self)
    end

    def intersects_with?(segment)
      Segment.have_intersecting_bounds?(self, segment) &&
        lies_on_line_intersecting?(segment) &&
        segment.lies_on_line_intersecting?(self)
    end
    
    def overlaps?(segment)
      Segment.have_intersecting_bounds?(self, segment) &&
        lies_on_one_line_with?(segment)
    end
    
    def intersection_point_with(segment)
      raise SegmentsDoNotIntersect unless intersects_with?(segment)
      raise SegmentsOverlap if overlaps?(segment)
      
      numerator = (segment.point1.y - point1.y) * (segment.point1.x - segment.point2.x) -
        (segment.point1.y - segment.point2.y) * (segment.point1.x - point1.x);
      denominator = (point2.y - point1.y) * (segment.point1.x - segment.point2.x) - 
        (segment.point1.y - segment.point2.y) * (point2.x - point1.x);

      t = numerator.to_f / denominator;
      
      x = point1.x + t * (point2.x - point1.x)
      y = point1.y + t * (point2.y - point1.y)            
      
      Point.new(x, y)
    end

    def length      
      Geometry.distance(point1, point2)
    end

    def to_vector
      Vector.new(point2.x - point1.x, point2.y - point1.y)
    end        

  protected

    def self.have_intersecting_bounds?(segment1, segment2)
      intersects_on_x_axis =
        (segment1.leftmost_endpoint.x < segment2.rightmost_endpoint.x ||
        segment1.leftmost_endpoint.x == segment2.rightmost_endpoint.x) &&
        (segment2.leftmost_endpoint.x < segment1.rightmost_endpoint.x ||
        segment2.leftmost_endpoint.x == segment1.rightmost_endpoint.x)
    
      intersects_on_y_axis =
        (segment1.bottommost_endpoint.y < segment2.topmost_endpoint.y ||
        segment1.bottommost_endpoint.y == segment2.topmost_endpoint.y) &&
        (segment2.bottommost_endpoint.y < segment1.topmost_endpoint.y ||
        segment2.bottommost_endpoint.y == segment1.topmost_endpoint.y)

      intersects_on_x_axis && intersects_on_y_axis
    end

    def lies_on_line_intersecting?(segment)
      vector_to_first_endpoint = Segment.new(self.point1, segment.point1).to_vector
      vector_to_second_endpoint = Segment.new(self.point1, segment.point2).to_vector

      #FIXME: '>=' and '<=' method of Fixnum and Float should be overriden too (take precision into account)
      # there is a rare case, when this method is wrong due to precision
      self.to_vector.cross_product(vector_to_first_endpoint) *
        self.to_vector.cross_product(vector_to_second_endpoint) <= 0
    end
  end
end

def Segment(point1, point2)
  Geometry::Segment.new point1, point2
end
