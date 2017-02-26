require_relative './glyph'
require 'pry'
class Window < Glyph
  def initialize(x0, x1, y0, y1)
    @x0 = x0
    @x1 = x1
    @y0 = y0
    @y1 = y1

    @children = []
  end

  private

  def draw?(x, y)
    x == x0 || x == x1 || y == y0 || y == y1
  end
end

class Rectangle < Glyph
  # change this by width and length because it is extremely confusing
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y

    @children = []
  end

  def bounds
    [x, y]
  end

  def draw?(xx, yy)
    xx == x0 && (yy >= y0 && yy <= y1) ||
    xx == x1 && (yy >= y0 && yy <= y1) ||
    yy == y0 && (xx >= x0 && xx <= x1) ||
    yy == y1 && (xx >= x0 && xx <= x1)
  end
end

class Circle < Glyph
  attr_reader :width, :height

  def initialize(r)
    @width = 2*r
    @height = 2*r

    @children = []
  end

  def bounds
    [width, height]
  end

  def draw?(xx, yy)
    in_area?(xx, yy) && cal_distance(xx,yy).round == @width / 2
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
    xx == x0 && (yy >= y0 && yy <= y1) ||
    xx == x1 && (yy >= y0 && yy <= y1) ||
    yy == y0 && (xx >= x0 && xx <= x1) ||
    yy == y1 && (xx >= x0 && xx <= x1)
  end
end

window = Window.new(0, 50, 0, 20)
rectangle1 = Rectangle.new(10, 10)
rectangle2 = Rectangle.new(13, 13)
circle = Circle.new(5)

window.insert(rectangle1)
window.insert(rectangle2)
window.insert(circle)
window.draw