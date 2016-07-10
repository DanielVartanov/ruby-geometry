require 'minitest/autorun'
require 'geometry'

class ContainsTest < Minitest::Test
  include Geometry

  def bounding_box
    BoundingBox.new Point(-1, -1), Point(1, 1)
  end

  def test_contains
    assert bounding_box.contains?(Point(0, 0))
  end

  def test_does_not_contain
    assert ! bounding_box.contains?(Point(2, 2))
    assert ! bounding_box.contains?(Point(-2, -2))
    assert ! bounding_box.contains?(Point(1, 2))
    assert ! bounding_box.contains?(Point(0, -1.1))
  end

  def test_on_the_edge
    assert bounding_box.contains?(Point(1, 0))
  end

  def test_at_vertex
    assert bounding_box.contains?(Point(1, 1))
  end
end
