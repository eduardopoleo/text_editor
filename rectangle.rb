require_relative './glyph'

class Rectangle < Glyph
  attr_reader :x, :y, :children
  attr_accessor :parent

  def initialize(x,y)
    @x = x
    @y = y
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
    symbol * x
  end

  def inner_lines
    (0...y-2).map { |index| inner_line_at(index) }
  end

  def inner_line_at(i)
    line = ""

    children.each do |c|
      if children_draws?(c, i)
        line += " #{children_line(c, i)} "
      end
    end
    line_beginning = symbol + line

    line_beginning + line_end(line_beginning.size)
  end

  def children_line(children, current_height)
    if current_height == 0 || current_height == children.y - 1
      children.horizontal_border
    else
      # this is cheating (sort of) and it will break when trying to fit
      # children in separate lines
      children.inner_line_at(current_height - 1)
    end
  end

  def line_end(current_line_size)
    " "*(x - current_line_size - 1) + symbol
  end

  def inner_filling
    f = ""

    inner_lines.each do |line|
      f += line + "\n"
    end

    f
  end

  def children_draws?(children, current_height)
    children.y > current_height
  end
end
