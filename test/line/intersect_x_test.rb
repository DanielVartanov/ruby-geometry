require 'minitest/autorun'
require 'geometry'

class IntersectXTest < MiniTest::Unit::TestCase
  include Geometry

  def test_vertical_non_overlapping
    l1 = Line.new_by_arrays([0, 0], [0, 1])
    l2 = Line.new_by_arrays([1, 0], [1, 1])
    assert l1.intersect_x(l2).nil?
  end

  def test_vertical_overlapping
    x = 0
    l1 = Line.new_by_arrays([x, 0], [x, 1])
    l2 = Line.new_by_arrays([x, 0], [x, 1])
    assert_equal x, l1.intersect_x(l2)
    assert_equal x, l2.intersect_x(l1)
  end

  def test_horizontal_non_overlapping
    l1 = Line.new_by_arrays([0, 0], [1, 0])
    l2 = Line.new_by_arrays([0, 1], [1, 1])
    p l1.intersect_x(l2)
    assert l1.intersect_x(l2).nil?
  end

  def test_horizontal_overlapping
    y = 0
    l1 = Line.new_by_arrays([0, y], [1, y])
    l2 = Line.new_by_arrays([0, y], [1, y])
    assert l1.intersect_x(l2).nil?
  end

  def test_perpendicular
    [-1, 0, 1].each do |xo|
      [-1, 0, 1].each do |yo|
        l1 = Line.new_by_arrays([xo, yo], [xo+0, yo+1])
        l2 = Line.new_by_arrays([xo, yo], [xo+1, yo+0])
        assert_equal xo, l1.intersect_x(l2)
        assert_equal xo, l2.intersect_x(l1)
      end
    end
  end
end
