require 'pry'

class Glyph
  attr_reader :x0, :x1, :y0, :y1
  attr_accessor :children

  def draw
    (y0..y1).each do |y|
      (x0..x1).each do |x|
        draw_point(x, y)
      end
      puts
    end
  end

  def insert(child)
    initialize_children(child)

    child.assign_coordinates(calculate_cordinates(child))
    children << child
  end

  def draw_point(x, y)
    print draw?(x, y) || children_draw?(x, y) ? pixel : " "
  end

  def area
    (x1 - x0) * (y1 - y2)
  end

  def bounds
    raise 'each glyph requires and implementation of its bounds'
  end

  def assign_coordinates(coordinates)
    @x0 = coordinates[0]
    @x1 = coordinates[1]
    @y0 = coordinates[2]
    @y1 = coordinates[3]
  end

  def draw?(x, y)
    raise "Every glyph should know how to draw itself"
  end

  def children_draw?(x, y)
    children.any? { |child| child.draw?(x, y) || child.children_draw?(x, y) }
  end

  private

  def initialize_children(child)
    # this is kind of shitty but it allows for a much better glyph interface
    @children ||= []
    child.children ||= []
  end

  def calculate_cordinates(child)
    if children.empty?
      next_child_x0 = x0 + 2
      next_child_x1 = next_child_x0 + child.bounds[0]
      next_child_y0 = y0 + 1
      next_child_y1 = next_child_y0 + child.bounds[1]
    else
      next_child_x0 = children.last.x1 + 2
      next_child_x1 = next_child_x0 + child.bounds[0]
      next_child_y0 = children.last.y0
      next_child_y1 = next_child_y0 + child.bounds[1]
    end

    [ next_child_x0, next_child_x1, next_child_y0, next_child_y1 ]
  end

  def pixel
    "#"
  end
end
