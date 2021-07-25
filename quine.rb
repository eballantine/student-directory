data = "\nputs \"data = \" data.inspect + data"
puts "data = " + data.inspect + data

# I really tried on my own, I even discovered .inspect which got me 
# close to a solution. However, it wasn't until a description from 
# Ju Liu https://juliu.is/quine-quine/ that it made sense, and I have
# shamelessly reused their exact construction. Obvs this comment won't
# print so I now have a failing quine.