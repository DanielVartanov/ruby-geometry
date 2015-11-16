require 'minitest/autorun'
require 'geometry'

class DistanceToTest < MiniTest::Unit::TestCase
  include Geometry

  # Distance in whole number
  def test_distance_to_point2
    point1 = Point.new(0, 0)
    point2 = Point.new(3, 4)
    assert_equal 5, point1.distance_to(point2)
  end

  # Distance in decimal
  # point 2 is right up
  def test_distance_to_point_right_up
    point1 = Point.new(0, 0)
    point2 = Point.new(1, 1)
    assert_equal Math.sqrt(2), point1.distance_to(point2)
  end

  # Point 2 is left up
  def test_distance_to_point_left_up
    point1 = Point.new(3, 0)
    point2 = Point.new(0, 4)
    assert_equal 5, point1.distance_to(point2)
  end

  # Point 2 is right below
  def test_distance_to_point_right_below
    point1 = Point.new(0, 4)
    point2 = Point.new(3, 0)
    assert_equal 5, point1.distance_to(point2)
  end

  # Point 2 is left below
  def test_distance_to_point_left_below
    point1 = Point.new(3, 4)
    point2 = Point.new(0, 0)
    assert_equal 5, point1.distance_to(point2)
  end

end
