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
