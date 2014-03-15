require 'minitest/autorun'
require 'geometry'

class AdvanceByTest < MiniTest::Unit::TestCase
  include Geometry

  def test_advance_by
    point = Point.new(10, 15)
    vector = Vector.new(-5, -10)
    assert_equal Point.new(5, 5), point.advance_by(vector)
  end
end
