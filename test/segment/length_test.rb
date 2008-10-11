require 'test/unit'
require 'geometry'

class LengthTest < Test::Unit::TestCase
  include Geometry
  
  def test_parallel_to_axis
    assert 1 === Segment.new_by_arrays([1, 1], [2, 1]).length
    assert 1 === Segment.new_by_arrays([1, 1], [1, 2]).length
  end

  def test_inclined
    assert sqrt(2) === Segment.new_by_arrays([1, 1], [2, 2]).length
  end
end
