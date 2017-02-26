require_relative './glyph'
require 'pry'
class Window < Glyph
  def initialize(x0, x1, y0, y1)
    @x0 = x0
    @x1 = x1
    @y0 = y0
    @y1 = y1
  end

  def bounds
    [x1, y1]
  end

  def draw?(x, y)
    x == x0 || x == x1 || y == y0 || y == y1
  end
end

class Rectangle < Glyph
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def bounds
    [width, height]
  end

  def draw?(xx, yy)
    xx == x0 && (yy >= y0 && yy <= y1) ||
    xx == x1 && (yy >= y0 && yy <= y1) ||
    yy == y0 && (xx >= x0 && xx <= x1) ||
    yy == y1 && (xx >= x0 && xx <= x1)
  end
end

class Circle < Glyph
  attr_reader :r

  def initialize(r)
    @r = r
  end

  def draw?(xx, yy)
    in_area?(xx, yy) && cal_distance(xx,yy).round == r
  end

  def bounds
    [2*r, 2*r]
  end

  private

  def cal_distance(xx, yy)
    Math.sqrt((xx - x_mid)**2 + (yy - y_mid)**2)
  end

  def x_mid
    (x1 + x0) / 2
  end

  def y_mid
    (y1 + y0) / 2
  end

  def in_area?(xx, yy)
    (yy >= y0 && yy <= y1) ||
    (yy >= y0 && yy <= y1) ||
    (xx >= x0 && xx <= x1) ||
    (xx >= x0 && xx <= x1)
  end
end

window = Window.new(0, 50, 0, 20)
rectangle1 = Rectangle.new(10, 10)
rectangle2 = Rectangle.new(13, 13)
circle = Circle.new(5)
circle1 = Circle.new(2)

window.insert(rectangle1)
window.insert(rectangle2)
window.insert(circle)
window.insert(circle1)
window.draw
