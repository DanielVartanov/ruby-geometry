require 'minitest/autorun'
require 'geometry'

class XInterceptTest < MiniTest::Unit::TestCase
  include Geometry

  def setup
    @inf = 1.0/0.0
  end

  def test_anchored_at_x_axis
    [-1, 0, 1].each do |xi|
      line = Line.new(Point.new(xi, 0), Point.new(1, 1))
      assert_equal xi, line.x_intercept
    end
  end

  def test_floating
    [-1, 1].each do |slope|
      [-2, 0, 2].each do |yo|
        [-1, 0, 1].each do |xi|
          point1 = Point.new(xi+yo/slope, yo)
          point2 = Point.new(xi+(yo+1)/slope, yo+1)
          line = Line.new(point1, point2)
          assert_equal xi, line.x_intercept
        end
      end
    end
  end

  def test_verticals
    [-1, 0, 1].each do |xi|
      line = Line.new(Point.new(xi, 1), Point.new(xi, 2))
      assert_equal xi, line.x_intercept
    end
  end

  def test_horizontals
    [-1, 0, 1].each do |yo|
      line = Line.new(Point.new(0, yo), Point.new(1, yo))
      assert line.x_intercept.nil?
    end
  end
end
