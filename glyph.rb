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
    "-" * x
  end

  def inner_line
    "-" + " "*(x-2) + "-"
  end

  private

  def inner_filling
    f = ""

    inner_lines.each do |line|
      f += line + padded_filling(line)
    end

    f
  end

  # this method will change depending on the filling strategy
  def inner_lines
    lines = []

    for i in 0...y-2
      line = ""

      children.each do |c|
        if children_draws?(c, i)
          children_line_type = line_type(c, i)
          line += " #{c.send(children_line_type)} "
        end
      end

      lines << "-" + line
    end

    lines
  end

  def line_type (children, current_height)
    current_height == 0 || current_height == children.y - 1 ? :horizontal_border : :inner_line
  end

  def children_draws?(children, current_height)
    children.y > current_height
  end


  def padded_filling(line)
    " "*(x - line.size - 1) + "-\n"
  end
end
