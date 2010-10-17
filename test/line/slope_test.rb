require 'test/unit'
require 'geometry'

class SlopeTest < Test::Unit::TestCase
  include Geometry

  def setup
    @inf = 1.0/0.0
  end

  def test_vertical
    [-1, 0, 1].each do |x|
      line = Line.new(Point.new(x, 0), Point.new(x, 1))
      assert_equal @inf, line.slope
    end
  end

  def test_vertical_negative
    [-1, 0, 1].each do |x|
      line = Line.new(Point.new(x, 0), Point.new(x, -1))
      assert_equal -@inf, line.slope
    end
  end

  def test_horizontal
    [-1, 0, 1].each do |y|
      line = Line.new(Point.new(0, y), Point.new(1, y))
      assert_equal 0, line.slope
    end
  end

  def test_horizontal_negative
    [-1, 0, 1].each do |y|
      line = Line.new(Point.new(0, y), Point.new(-1, y))
      assert_equal 0, line.slope
    end
  end

  def test_full_circle
    delta = 0.000001
    increment = Math::PI/10
    divisions = 2*Math::PI/increment
    radius = 1
    (0..divisions).each do |d|
      angle = d*increment
      y = radius*Math::sin(angle)
      x = radius*Math::cos(angle)
      line = Line.new(Point.new(0, 0), Point.new(x, y))
      
      assert_in_delta Math::tan(angle), line.slope, delta
    end
  end
end
