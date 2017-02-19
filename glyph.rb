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
  attr_reader :x, :y, :children, :name
  attr_accessor :parent

  def initialize(x,y, name)
    @x = x
    @y = y
    @name = name
    @parent = {}
    @children = []
  end

  def draw
    puts horizontal_border + "\n" + inner_filling + horizontal_border
  end

  def insert(glyph)
    @children << glyph
    glyph.parent = self
  end

  def horizontal_border
    "-" * x
  end

  def inner_filling
    f = ""

    inner_lines.each do |line|
      f += line + "\n"
    end

    f
  end

  def inner_lines
    (0...y-2).map { |index| inner_line_at(index) }
  end

  def inner_line_at(i)
    line = ""

    children.each do |c|
      if children_draws?(c, i)
        line += "#{children_line(c, i)} "
      end
    end
    something = "-" + line

    something + " "*(x - something.size - 1) + "-"
  end

  def children_draws?(children, current_height)
    children.y > current_height
  end

  def children_line(children, current_height)
    if current_height == 0 || current_height == children.y - 1
      children.horizontal_border
    else
      children.inner_line_at(current_height)
    end
  end
end
