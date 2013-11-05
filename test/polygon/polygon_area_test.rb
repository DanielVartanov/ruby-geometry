require 'test/unit'
require 'geometry'

class PolygonAreaTest < Test::Unit::TestCase
  include Geometry
  def test_area_of_empty_polygon
    polygon = Polygon.new []

    assert_equal 0, polygon.area
  end

  def test_area_of_two_points_polygon
    polygon = Polygon.new [Point(0,0), Point(1,1)]

    assert_equal 0, polygon.area
  end

  def test_area_of_triangle
    polygon = Polygon.new [Point(0,0), Point(1,1), Point(0,1)]

    assert_equal 0.5, polygon.area
  end

  def test_area_of_square
    polygon = Polygon.new [Point(0,0), Point(0,2), Point(2,2), Point(2,0)]

    assert_equal 4, polygon.area
  end

  def test_area_of_quadralateral
    polygon = Polygon.new [Point(4,10), Point(9,7), Point(11,2), Point(2,2)]

    assert_equal 45.5, polygon.area
  end
end