require 'minitest/autorun'
require 'geometry'

class CollinearWithTest < MiniTest::Unit::TestCase
  include Geometry

  def test_vectors_are_collinear
    vector1 = Vector.new(1, 2)
    vector2 = Vector.new(2, 4)
    
    assert vector1.collinear_with?(vector2)
  end

  def test_vectors_are_not_collinear
    vector1 = Vector.new(1, 2)
    vector2 = Vector.new(1, 1)
    
    assert ! vector1.collinear_with?(vector2)
  end
  
  def test_vectors_are_oppositely_directed
    vector1 = Vector.new(2, 2)
    vector2 = Vector.new(-2, -2)
    
    assert vector1.collinear_with?(vector2)
  end
end
