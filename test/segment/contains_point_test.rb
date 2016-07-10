require 'minitest/autorun'
require 'geometry'

class ContainsPointTest < Minitest::Test
  include Geometry

  #  ----*----
  def test_point_belongs_to_horizontal_segment
    point = Point.new(3, 1)
    segment = Segment.new_by_arrays([2, 1], [4, 1])

    assert segment.contains_point?(point)
  end

  #     /
  #    *
  #   /
  def test_point_belongs_to_inclined_segment
    point = Point.new(3, 3)
    segment = Segment.new_by_arrays([2, 2], [4, 4])

    assert segment.contains_point?(point)
  end

  #  *--------
  def test_point_is_segment_endpoint
    point = Point.new(2, 1)
    segment = Segment.new_by_arrays([2, 1], [4, 1])

    assert segment.contains_point?(point)
  end

  #      *
  #  ---------
  def test_piont_does_not_belong_to_segment
    point = Point.new(2, 3)
    segment = Segment.new_by_arrays([2, 1], [4, 1])

    assert ! segment.contains_point?(point)
  end

  # *  ---------
  def test_point_on_same_horizontal_line
    point = Point.new(1, 1)
    segment = Segment.new_by_arrays([2, 1], [4, 1])

    assert ! segment.contains_point?(point)
  end

  #     /
  #    /
  #   /
  #
  # *
  def test_point_on_same_inclined_line
    point = Point.new(1, 1)
    segment = Segment.new_by_arrays([2, 2], [4, 4])

    assert ! segment.contains_point?(point)
  end
end
