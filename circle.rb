require_relative './glyph'

class Circle < Glyph
  attr_reader :r, :children

  def initialize(r)
    @r = r
    @children = []
  end

  def draw
    (-r..r).each do |x|
      (-r..r).each do |y|
        print cal_distance(x,y).round == r ? symbol : " "
      end
      puts unless x == r
    end
  end

  def insert(child)
    children << child
  end

  private

  def cal_distance(x,y)
    Math.sqrt(x**2 + y**2)
  end
end


Circle.new(5).draw
