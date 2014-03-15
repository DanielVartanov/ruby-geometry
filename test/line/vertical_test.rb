require 'minitest/autorun'
require 'geometry'

class VerticalTest < MiniTest::Unit::TestCase
  include Geometry

  def test_vertical
    x, y = 0, 0
    l1 = Line.new_by_arrays([x, y], [x, y+1])
    assert l1.vertical?
  end

  def test_not_vertical
    x, y = 0, 0
    l1 = Line.new_by_arrays([x, y], [x+1, y+1])
    assert ! l1.vertical?
  end
end
