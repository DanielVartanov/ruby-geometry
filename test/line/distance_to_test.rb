require 'test/unit'
require 'geometry'

class DistanceToTest < Test::Unit::TestCase
  include Geometry

  def test_distance_to_point_on_line
    line = Line.new_by_arrays([0, 2], [2, 0])
    point = Point.new(1,1)
    assert_equal 0, line.distance_to(point)
  end

  def test_distance_to_flat_line
    line = Line.new_by_arrays([0, 1], [2, 1])
    point = Point.new(1, 2)
    assert_equal 1, line.distance_to(point)
  end
end