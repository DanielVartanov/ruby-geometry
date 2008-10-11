require 'test/unit'
require 'geometry'

class ParallelToTest < Test::Unit::TestCase
  include Geometry
  
  def test_segments_are_parallel
    segment1 = Segment.new_by_arrays([0, 0], [2, 1])
    segment2 = Segment.new_by_arrays([1, 1], [5, 3])
    
    assert segment1.parallel_to?(segment2)
  end
  
  def test_segments_are_not_parallel
    segment1 = Segment.new_by_arrays([0, 0], [2, 1])
    segment2 = Segment.new_by_arrays([1, 1], [2, 2])
    
    assert ! segment1.parallel_to?(segment2)
  end

  def test_segment_lay_on_same_line
    segment1 = Segment.new_by_arrays([0, 0], [1, 1])
    segment2 = Segment.new_by_arrays([2, 2], [3, 3])
    
    assert segment1.parallel_to?(segment2)
  end
end