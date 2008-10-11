require 'test/unit'
require 'geometry'

class ScalarProductTest < Test::Unit::TestCase
  include Geometry

  def test_vectors_are_perpendicular
    assert 0 === Vector.new(1, 1).scalar_product(Vector.new(-1, 1))
  end

  def test_vectors_are_collinear
    assert(-4 === Vector.new(1, 1).scalar_product(Vector.new(-2, -2)))
  end

  def test_vectors_are_inclined
    assert 1 === Vector.new(1, 1).scalar_product(Vector.new(0, 1))
  end
end
