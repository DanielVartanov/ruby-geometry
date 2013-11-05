module Geometry
  class Polygon < Struct.new(:vertices)
    def edges
      edges = []

      1.upto(vertices.length - 1) do |vertex_index|
        edges << Segment.new(vertices[vertex_index - 1], vertices[vertex_index])
      end

      edges << Segment.new(vertices.last, vertices.first)
    end

    def bounding_box
      leftbottom = Point vertices.map(&:x).min, vertices.map(&:y).min
      righttop = Point vertices.map(&:x).max, vertices.map(&:y).max
      
      BoundingBox.new leftbottom, righttop
    end

    def contains?(point)
      point_in_polygon = PointInPolygon.new(point, self)
      point_in_polygon.inside? || point_in_polygon.on_the_boundary?
    end

    def area
      sum = 0.0
      (0..vertices.length-1).each do |i|
        a = vertices[i-1]
        b = vertices[i]

        sum = sum + ((a.x * b.y) - (a.y * b.x))
      end
      (sum/2).abs
    end
  end
end

def Polygon(vertices)
  Geometry::Polygon.new(vertices)
end
