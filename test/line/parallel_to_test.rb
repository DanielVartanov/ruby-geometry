require 'minitest/autorun'
require 'geometry'

class ParallelToTest < MiniTest::Unit::TestCase
  include Geometry

  def test_identical
    num_tests = 100
    (1..num_tests).each do
      point1 = [rand-0.5, rand-0.5]
      point2 = [rand-0.5, rand-0.5]
      line = Line.new_by_arrays(point1, point2)
      assert line.parallel_to? line
    end
  end

  def test_verticals
    up = Line.new_by_arrays([0, 0], [0, 1])
    down = Line.new_by_arrays([0, 0], [0, -1])
    assert up.parallel_to? down
    assert down.parallel_to? up
  end

  def test_horizontals
    left = Line.new_by_arrays([0, 0], [-1, 0])
    right = Line.new_by_arrays([0, 0], [1, 0])
    assert left.parallel_to? right
    assert right.parallel_to? left
  end

  def test_shifted
    shift = 1
    l1 = Line.new_by_arrays([0, 0], [1, 1])
    l2 = Line.new_by_arrays([0+shift, 0], [1+shift, 1])
    assert l1.parallel_to? l2
    assert l2.parallel_to? l1
  end

  def test_not_parallel
    l1 = Line.new_by_arrays([0, 0], [1, 1])
    l2 = Line.new_by_arrays([0, 0], [1, -1])
    assert ! l1.parallel_to?(l2)
    assert ! l1.parallel_to?(l2)
  end
end
