data = File.open("day12.txt").readlines.map(&:chomp)

# ship location
s_east = 0
s_west = 0
s_north = 0
s_south = 0
# waypoint location
w_east_west = 10   # east is positive, west is negative
w_north_south = 1  # north is positive, south is negative

data.each do |move|
  if move[0] == 'N'
    w_north_south += move[1..-1].to_i
  elsif move[0] == 'S'
    w_north_south -= move[1..-1].to_i
  elsif move[0] == 'E'
    w_east_west += move[1..-1].to_i
  elsif move[0] == 'W'
    w_east_west -= move[1..-1].to_i
  end
  
  if move[0] == 'R' 
    if move[1..-1].to_i == 90
      w_east_west, w_north_south = w_north_south, -w_east_west
    elsif move[1..-1].to_i == 180
      w_east_west, w_north_south = -w_east_west, -w_north_south
    elsif move[1..-1].to_i == 270
      w_east_west, w_north_south = -w_north_south, w_east_west
    end  
  elsif move[0] == 'L' 
    if move[1..-1].to_i == 90
      w_east_west, w_north_south = -w_north_south, w_east_west
    elsif move[1..-1].to_i == 180
      w_east_west, w_north_south = -w_east_west, -w_north_south
    elsif move[1..-1].to_i == 270
      w_east_west, w_north_south = w_north_south, -w_east_west
    end  
  elsif move[0] == 'F'
    s_east += w_east_west * move[1..-1].to_i if w_east_west >= 0
    s_west += (w_east_west).abs * move[1..-1].to_i if w_east_west < 0
    s_north += w_north_south * move[1..-1].to_i if w_north_south >= 0
    s_south += (w_north_south).abs * move[1..-1].to_i if w_north_south < 0
  end
end

p (s_east-s_west).abs+(s_north-s_south).abs
