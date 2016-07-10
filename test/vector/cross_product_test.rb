require 'minitest/autorun'
require 'geometry'

class CrossProductTest < Minitest::Test
  include Geometry

  def test_positive
    assert 1 === Vector.new(1, 0).cross_product(Vector.new(0, 1))
  end

  def test_negative
    assert(-1 === Vector.new(0, 1).cross_product(Vector.new(1, 0)))
  end

  def test_zero
    assert 0 === Vector.new(1, 1).cross_product(Vector.new(-2, -2))
  end

  def test_unnormalized
    assert 4 === Vector.new(1, 1).cross_product(Vector.new(-2, 2))
  end
end
