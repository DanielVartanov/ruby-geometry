module Geometry
  class BoundingBox < Struct.new(:leftbottom, :righttop)
    def diagonal
      Segment leftbottom, righttop
    end

    def contains?(point)
      point.x.between?(leftbottom.x, righttop.x) && point.y.between?(leftbottom.y, righttop.y)
    end
  end
end
