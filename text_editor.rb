require_relative "./glyph"

rec1 = Rectangle.new(50, 20)

rec2 = Rectangle.new(20, 10)
rec3 = Rectangle.new(20, 10)


rec1.insert(rec2)
rec1.insert(rec3)


rec1.draw
