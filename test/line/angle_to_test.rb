require 'test/unit'
require 'geometry'

class AngleToTest < Test::Unit::TestCase
  include Geometry

  def test_angle_to_self
    line = Line.new_by_arrays([0, 0], [1, 1])
    assert_equal 0, line.angle_to(line)
  end

  def test_angle_to_perpendicular
    line = Line.new_by_arrays([0, 0], [1, 1])
    perp = Line.new_by_arrays([0, 0], [1, -1])
    assert_equal Math::PI/2, line.angle_to(perp)
    assert_equal Math::PI/2, perp.angle_to(line)
  end

  def test_angle_to_acute
    line = Line.new_by_arrays([0, 0], [1, 1])
    acute = Line.new_by_arrays([0, 0], [0, 1])
    assert_equal Math::PI/4, line.angle_to(acute)
    assert_equal Math::PI/4, acute.angle_to(line)
  end
end
