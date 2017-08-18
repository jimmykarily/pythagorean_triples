#!/usr/bin/env ruby
# This script generates Pythagorean triples
# If LIMIT is defined it will generate only the points in a LIMITxLIMIT square.
# If not it will try to find all triples (running infinitely)
#
# Use gnuplot -c plot to generate a graph.png image with x,y points

f = File.open("data.dat", 'w')

# Comment out to run forever (will generate a diffent chart)
LIMIT=ENV['LIMIT'].to_i if ENV['LIMIT']

x = 0
while (x += 1) && (! defined?(LIMIT) || x < LIMIT)
  y = x + 1
  while (y+1)**2 - y**2 <= x**2 && (! defined?(LIMIT) || y < LIMIT)
    z = y + 1
    while z**2 <= x**2 + y**2 && (! defined?(LIMIT) || z < LIMIT)
      if z**2 == x**2 + y**2
        puts "[#{x},#{y},#{z}] -> (#{x**2} + #{y**2} = #{z**2})"
        f.write("#{x} #{y}\n")
        f.write("#{y} #{x}\n")
      end
      z += 1
    end
    y += 1
  end
end
