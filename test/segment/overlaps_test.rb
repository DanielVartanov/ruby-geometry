require 'minitest/autorun'
require 'geometry'

class OverlapsTest < MiniTest::Unit::TestCase
  include Geometry

  def test_overlaps
    segment1 = Segment.new_by_arrays([0, 0], [2, 0])
    segment2 = Segment.new_by_arrays([1, 0], [3, 0])

    assert segment1.overlaps?(segment2)
  end

  def test_same_segment
    segment1 = Segment.new_by_arrays([0, 0], [2, 0])
    assert segment1.overlaps?(segment1)
  end

  def test_intersects_in_one_point
    segment1 = Segment.new_by_arrays([0, 0], [1, 0])
    segment2 = Segment.new_by_arrays([1, 0], [1, 1])

    assert ! segment1.overlaps?(segment2)
  end

  def test_lies_on_one_line_and_have_common_endpoint
    segment1 = Segment.new_by_arrays([0, 0], [1, 0])
    segment2 = Segment.new_by_arrays([1, 0], [2, 0])

    assert ! segment1.overlaps?(segment2)
  end

  def test_lies_on_one_line
    segment1 = Segment.new_by_arrays([0, 0], [2, 0])
    segment2 = Segment.new_by_arrays([4, 0], [6, 0])
    
    assert ! segment1.overlaps?(segment2)
  end
  
  def test_lies_on_one_vertical_line
    segment1 = Segment.new_by_arrays([0, 0], [0, 1])
    segment2 = Segment.new_by_arrays([0, 2], [0, 3])
    
    assert ! segment1.overlaps?(segment2)
  end
end