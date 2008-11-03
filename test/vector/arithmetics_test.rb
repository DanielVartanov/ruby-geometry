require 'test/unit'
require 'geometry'

class ArithmeticsTest < Test::Unit::TestCase
  include Geometry

  def test_addition
    assert_equal Vector.new(4, 6), Vector.new(1, 2) + Vector.new(3, 4)
  end

  def test_subtraction
    assert_equal Vector.new(-2, -4), Vector.new(1, 0) - Vector.new(3, 4)
  end

  def test_vector_multiplied_by_scalar
    assert_equal Vector.new(-2, -4), Vector.new(1, 2) * -2
  end

  def test_scalar_multiplied_by_vector
    assert_equal Vector.new(-2, -4), -2 * Vector.new(1, 2)
  end
end