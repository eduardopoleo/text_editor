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

window = Window.new(0, 50, 0, 20)
rectangle = Rectangle.new(5, 5)

window.insert(rectangle)
window.draw
