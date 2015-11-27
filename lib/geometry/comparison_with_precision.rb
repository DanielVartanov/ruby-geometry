class Float
  def ===(other)
    (self - other).abs <= Float::EPSILON * 2
  end
end

class Fixnum
  def ===(other)
    self == other
  end
end