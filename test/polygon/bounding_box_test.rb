require 'minitest/autorun'
require 'geometry'

class BoundingBoxTest < MiniTest::Unit::TestCase
  include Geometry

  def test_rectangle
    polygon = Polygon [
                       Point(-1, -1),
                       Point(1, -1),
                       Point(1, 1),
                       Point(-1, 1)
                      ]
    assert polygon.bounding_box.leftbottom == Point(-1, -1)
    assert polygon.bounding_box.righttop == Point(1, 1)
  end

  def test_sloped_rectangle
    polygon = Polygon [
                       Point(-1, 0),
                       Point(0, -1),
                       Point(1, 0),
                       Point(0, 1)
                      ]
    
    assert polygon.bounding_box.leftbottom == Point(-1, -1)
    assert polygon.bounding_box.righttop == Point(1, 1)
  end

  def test_nonconvex
    polygon = Polygon [
                       Point(0, 2),
                       Point(2, 0),
                       Point(5, 1),
                       Point(3, 8),
                       Point(3, 1),
                       Point(1, 4)
                      ]

    assert polygon.bounding_box.leftbottom == Point(0, 0)
    assert polygon.bounding_box.righttop == Point(5, 8)
  end
end
