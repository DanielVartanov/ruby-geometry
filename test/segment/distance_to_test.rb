require 'minitest/autorun'
require 'geometry'

class DistanceToTest < MiniTest::Unit::TestCase
  include Geometry

  def test_distance_to_point_on_segment
    segment = Segment.new_by_arrays([0, 2], [2, 0])
    point = Point.new(1,1)
    assert_equal 0, segment.distance_to(point)
  end

  def test_distance_to_flat_segment
    segment = Segment.new_by_arrays([0, 1], [2, 1])
    point = Point.new(1, 2)
    assert_equal 1, segment.distance_to(point)
  end

  def test_distance_to_segment_start
    segment = Segment.new_by_arrays([1, 1], [2, 1])
    point = Point.new(0, 1)
    assert_equal 1, segment.distance_to(point)
  end

  def test_distance_to_segment_end
    segment = Segment.new_by_arrays([0, 1], [0, 2])
    point = Point.new(0, 3)
    assert_equal 1, segment.distance_to(point)
  end

  def test_distance_to_point_segment
    segment = Segment.new_by_arrays([0, 1], [0, 1])
    point = Point.new(1, 1)
    assert_equal 1, segment.distance_to(point)
  end

end
