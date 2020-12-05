    # Right 1, down 1.
    # Right 3, down 1. (This is the slope you already checked.)
    # Right 5, down 1.
    # Right 7, down 1.
    # Right 1, down 2.

def slope_count(right, down)
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
      x -= (single_map - 1)  
      x -= 1    
    end

      moving = data[y][x]

    if moving == "#"
      trees += 1
    end
    x += right
    y += down
  end
  return trees
end

slope1 = slope_count(1, 1)
slope2 = slope_count(3, 1)
slope3 = slope_count(5, 1)
slope4 = slope_count(7, 1)
slope5 = slope_count(1, 2)
p slope1 * slope2 * slope3 * slope4 * slope5
