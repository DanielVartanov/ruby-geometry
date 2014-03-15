require 'minitest/autorun'
require 'geometry'

class InitializeTest < MiniTest::Unit::TestCase
  include Geometry
  
  def test_initialize_by_numbers
    point = Point.new(1, 2)
    
    assert_equal 1, point.x
    assert_equal 2, point.y
  end
  
  def test_initialize_by_array
    point = Point.new_by_array([1, 2])
    
    assert_equal 1, point.x
    assert_equal 2, point.y
  end
end