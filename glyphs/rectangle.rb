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
