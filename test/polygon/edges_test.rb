require 'test/unit'
require 'geometry'

class EdgesTest < Test::Unit::TestCase
  include Geometry
  
#  +-----+
#  |     |
#  |     |
#  +-----+
  def test_regular
    vertices = [
      Point.new(0, 0),
      Point.new(1, 0),
      Point.new(1, 1),
      Point.new(0, 1)
    ]
    
    polygon = Polygon.new(vertices)

    expected_edges = [
      Segment.new_by_arrays(vertices[0], vertices[1]),
      Segment.new_by_arrays(vertices[1], vertices[2]),
      Segment.new_by_arrays(vertices[2], vertices[3]),
      Segment.new_by_arrays(vertices[3], vertices[0])
    ]

    assert_equal expected_edges, polygon.edges    
  end
  
#           /\
#          /  \
#    -----------
#     \  /
#      \/
  def test_self_intersecting
    vertices = [
      Point.new(0, 0),
      Point.new(4, 0),
      Point.new(3, 2),
      Point.new(1, -2),
    ]

    polygon = Polygon.new(vertices)

    expected_edges = [
      Segment.new_by_arrays(vertices[0], vertices[1]),
      Segment.new_by_arrays(vertices[1], vertices[2]),
      Segment.new_by_arrays(vertices[2], vertices[3]),
      Segment.new_by_arrays(vertices[3], vertices[0])
    ]

    assert_equal expected_edges, polygon.edges
  end
  
end