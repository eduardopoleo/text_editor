require_relative "./rectangle"
require_relative "./circle"

rec1 = Rectangle.new(100, 20)
rec2 = Rectangle.new(20, 10)
rec3 = Rectangle.new(20, 5)
rec4 = Rectangle.new(5, 5)

rec1.insert(rec2)
rec1.insert(rec3)

rec2.insert(rec4)

rec1.draw
