class Glyph
  attr_reader :children, :x0, :x1, :y0, :y1

  def draw
    (y0..y1).each do |y|
      (x0..x1).each do |x|
        draw_point(x, y)
      end
      puts
    end
  end

  def insert(child)
    raise "There is not enough area available" if child.area > area
    child.assign_coordinates(initial_x, final_x, initial_y, final_y)
    @children << child
  end

  def draw_point(x, y)
    print draw?(x, y) || children_draw?(x, y) ? pixel : " "
  end

  def area
    (x1 - x0) * (y1 - y2)
  end

  private

  def initial_x
    children.last.x1 + 1
  end

  def final_x
    initial_x + child.x
  end

  def initial_y

  end

  def available_area
    area - children_area
  end

  def children_area
    children.reduce {|memo, child| memo += child.area }
  end

  def draw?(x, y)
    raise "Every glyph should know how to draw itself"
  end

  def children_draw?(x, y)
    children.any? { |child| child.draw?(x, y) || child.children_draw?(x, y) }
  end

  def pixel
    "#"
  end
end

class Window < Glyph
  def initialize(x0, x1, y0, y1)
    @x0 = x0
    @x1 = x1
    @y0 = y0
    @y1 = y1

    @children = []
  end

  private

  def draw?(x, y)
    x == x0 || x == x1 || y == y0 || y == y1
  end
end

class Rectangle < Glyph
  def initialize(x, y)
    @area = x * y
  end

  private

  def draw?(x, y)
    x == x0 || x == x1 || y == y0 || y == y1
  end
end

Window.new(0, 50, 0, 20).draw
