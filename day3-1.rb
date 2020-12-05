data = File.open("day3.txt").readlines.map(&:chomp)

# get to the bottom (323), down 1
bottom = data.length
# the length of a single map(31)
single_map = data[0].length

trees = 0
x = 0
y = 0

while y < bottom
  if x >= (single_map - 1)
    x -= (single_map - 1)  # single_map is length, to match the index, here minus 1
    x -= 1        # when go circle back to 0, need to count 0 as a place, so here minus 1
  end

  moving = data[y][x]

  if moving == "#"
    trees += 1
  end
  x += 3
  y += 1
  
end

p trees
