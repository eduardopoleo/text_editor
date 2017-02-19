class Glyph
  def initialize(x,y)
  end

  def draw

  end

  def intersects(p)
  end

  def insert(glyph, cordinates)
  end
end

class Rectangle < Glyph
  attr_reader :x, :y

  def initialize(x,y)
    @x = x
    @y = y
    @children = []
  end

  def draw
    puts horizontal_border + "\n" + inner_filling + horizontal_border
  end

  def insert(glyph)
    @children << glyph
  end

  def horizontal_border
    "_" * x
  end

  def inner_line
    "-" + " "*(x-2) + "-"
  end

  def inner_filling
    f = ""

    inner_lines.each do |line|
      f += line + "\n"
    end

    f
  end
# this method will change depending on children
  def inner_lines
    lines = []

    for i in 0...y-2
      lines << inner_line
    end

    lines
  end
end
