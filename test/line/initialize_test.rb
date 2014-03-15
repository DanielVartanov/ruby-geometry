require 'minitest/autorun'
require 'geometry'

class InitializeTest < MiniTest::Unit::TestCase
  include Geometry

  def test_initialize_by_points
    line = Line.new(Point.new(1, 2), Point.new(3, 4))

    assert_equal Point.new(1, 2), line.point1
    assert_equal Point.new(3, 4), line.point2
  end

  def test_initialize_by_points_coordinates_arrays
    line = Line.new_by_arrays([1, 2], [3, 4])

    assert_equal Point.new(1, 2), line.point1
    assert_equal Point.new(3, 4), line.point2
  end
end
