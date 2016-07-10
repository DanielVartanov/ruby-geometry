require 'minitest/autorun'
require 'geometry'

class EqualsTest < Minitest::Test
  include Geometry

  def test_equal
    assert_equal Vector.new(1, 3), Vector.new(1, 3)
  end

  def test_not_equal
    refute_equal Vector.new(1, 3), Vector.new(1, 2)
    refute_equal Vector.new(1, 2), Vector.new(0, 2)
  end
end
