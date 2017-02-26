require 'pry'

class Glyph
  attr_reader :children
  attr_accessor :x0, :x1, :y0, :y1

  def draw
    (y0..y1).each do |y|
      (x0..x1).each do |x|
        draw_point(x, y)
      end
      puts
    end
  end

  def insert(child)
    child.assign_coordinates(calculate_cordinates(child))
    @children << child
  end

  def draw_point(x, y)
    print draw?(x, y) || children_draw?(x, y) ? pixel : " "
  end

  def area
    (x1 - x0) * (y1 - y2)
  end

  def bounds
    raise "Every child must know how to determine the x, y that determine the rectangular area its occupy"
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

  def available_area
    area - children_area
  end

  def children_area
    children.reduce {|memo, child| memo += child.area }
  end

  def pixel
    "#"
  end
end
