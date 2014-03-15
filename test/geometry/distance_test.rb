require 'minitest/autorun'
require 'geometry'

class DistanceTest < MiniTest::Unit::TestCase
  include Geometry

  def test_trivial_cases    
    assert 1 === distance(Point.new(1, 1), Point.new(1, 2))

    assert 1 === distance(Point.new(1, 1), Point.new(2, 1))

    assert sqrt(2) === distance(Point.new(1, 1), Point.new(2, 2))
  end    
end