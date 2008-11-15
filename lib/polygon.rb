module Geometry
  class Polygon < Struct.new(:vertices)
    def edges
      edges = []

      1.upto(vertices.length - 1) do |vertex_index|
        edges << Segment.new(vertices[vertex_index - 1], vertices[vertex_index])
      end

      edges << Segment.new(vertices.last, vertices.first)
    end
  end
end