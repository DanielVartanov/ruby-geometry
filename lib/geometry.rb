require "active_support/core_ext/module/delegation"
require "memoist"

require 'point'
require 'segment'
require 'vector'
require 'polygon'
require 'line'
require 'bounding_box'
require 'algorithms/point_in_polygon'

module Geometry
  include Math
  extend Math
  
  def distance(point1, point2)
    hypot point1.x - point2.x, point1.y - point2.y
  end

  module_function :distance
end
