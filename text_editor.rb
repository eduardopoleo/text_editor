Dir["./glyphs/*.rb"].each {|file| require file }

window = Window.new(0, 50, 0, 20)
rectangle1 = Rectangle.new(10, 10)
rectangle2 = Rectangle.new(13, 13)
circle = Circle.new(5)
circle1 = Circle.new(2)

window.insert(rectangle1)
window.insert(rectangle2)
window.insert(circle)
window.insert(circle1)
window.draw
