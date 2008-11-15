require 'test/unit'
require 'geometry'

class IntersectsTest < Test::Unit::TestCase
  include Geometry

  def test_segments_parralel_but_on_different_lines
    segment1 = Segment.new_by_arrays([0, 1], [2, 1])
    segment2 = Segment.new_by_arrays([0, 0], [2, 0])

    assert ! segment1.lies_on_one_line_with?(segment2)
  end

  def test_segments_are_not_parallel
    segment1 = Segment.new_by_arrays([0, 0], [2, 0])
    segment2 = Segment.new_by_arrays([0, 1], [2, 2])

    assert ! segment1.lies_on_one_line_with?(segment2)
  end
    
  def test_segments_lie_on_one_line
    segment1 = Segment.new_by_arrays([0, 0], [1, 0])
    segment2 = Segment.new_by_arrays([2, 0], [3, 0])

    assert segment1.lies_on_one_line_with?(segment2)
  end

  def test_segments_lin_on_one_vertical_line
    segment1 = Segment.new_by_arrays([0, 0], [0, 1])
    segment2 = Segment.new_by_arrays([0, 2], [0, 3])

    assert segment1.lies_on_one_line_with?(segment2)
  end
end