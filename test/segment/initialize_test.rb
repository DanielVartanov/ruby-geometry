require 'test/unit'
require 'geometry'

class InitializeTest < Test::Unit::TestCase
  include Geometry

  def test_initialize_by_points
    segment = Segment.new(Point.new(1, 2), Point.new(3, 4))

    assert_equal Point.new(1, 2), segment.point1
    assert_equal Point.new(3, 4), segment.point2
  end

  def test_initialize_by_points_coordinates_arrays
    segment = Segment.new_by_arrays([1, 2], [3, 4])

    assert_equal Point.new(1, 2), segment.point1
    assert_equal Point.new(3, 4), segment.point2
  end
end