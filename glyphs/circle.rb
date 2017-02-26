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
