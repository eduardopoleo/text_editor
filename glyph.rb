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
  attr_reader :x, :y, :children

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

  private
  # this method will change depending on the filling strategy
  def inner_lines
    lines = []

    for i in 0...y-2
      if children.length == 0
        lines << inner_line
      else
        children_line = ""

        children.each do |c|
          children_line += c.inner_line
        end

        lines << "-" + children_line + "-"
      end
    end

    lines
  end

  def inner_filling
    f = ""

    inner_lines.each do |line|
      f += line + padded_filling(line)
    end

    f
  end

  def padded_filling(line)
    " "*(x - line.size - 1) + "-\n"
  end
end
