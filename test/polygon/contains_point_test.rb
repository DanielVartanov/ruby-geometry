require 'minitest/autorun'
require 'geometry'

class ContainsPointTest < MiniTest::Unit::TestCase
  include Geometry

  def test_convex
    rectangle = Polygon.new [
                             Point(0, 0),
                             Point(1, 0),
                             Point(1, 1),
                             Point(0, 1)
                            ]
    

    inner = Point(0.5, 0.5)
    assert rectangle.contains?(inner)

    outer = Point(1.5, 1.5)
    assert ! rectangle.contains?(outer)

    on_edge = Point(0.5, 1)
    assert rectangle.contains?(on_edge)

    at_vertex = Point(1, 1)
    assert rectangle.contains?(at_vertex)
  end
  

  # +--------+
  # |        |
  # |    +---+
  # |    |
  # |    +---+
  # |        |
  # +--------+ 

  def test_nonconvex
    nonconvex_polygon = Polygon.new [
                                     Point(0, 0),
                                     Point(0, 6),
                                     Point(4, 6),
                                     Point(4, 4),
                                     Point(2, 4),
                                     Point(2, 2),
                                     Point(4, 2),
                                     Point(4, 0)
                                    ]

    inner_points = [
                    Point(1, 5),
                    Point(3, 5),
                    Point(1, 3),
                    Point(1, 1),
                    Point(3, 1)
                   ]

    outer_points = [
                    Point(7, 5),
                    Point(5, 3),
                    Point(7, 3),
                    Point(7, 1)
                   ]

    inner_points.each do |inner_point|
      assert nonconvex_polygon.contains?(inner_point)
    end

    outer_points.each do |outer_point|
      assert ! nonconvex_polygon.contains?(outer_point)
    end
  end
end
