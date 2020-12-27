data = File.open("day12.txt").readlines.map(&:chomp)

east = 0
west = 0
north = 0
south = 0
# start from facing East
facing = 0 # east
# facing south is 1, west is 2, north is 3

def facing_determine(original_facing, move)
  if move[0] == 'L'
    if move[1..-1].to_i/90 == 1 
      original_facing += 3
    elsif move[1..-1].to_i/90 == 2
      original_facing += 2
    elsif move[1..-1].to_i/90 == 3
      original_facing += 1
    end
    original_facing = original_facing%4 if original_facing > 3
  elsif move[0] == 'R'
    original_facing += move[1..-1].to_i/90 
    original_facing = original_facing%4 if original_facing > 3
  end
  return original_facing
end

data.each do |move|
  facing = facing_determine(facing, move) if move[0] == 'L' || move[0] == 'R' 
  if facing == 0 # east
    if move[0] == 'F' || move[0] == 'E'
      east += move[1..-1].to_i 
    elsif move[0] == 'N'
      north += move[1..-1].to_i
    elsif move[0] == 'S'
      south += move[1..-1].to_i  
    elsif move[0] == 'W'
      west += move[1..-1].to_i  
    end
  elsif facing == 1 # south
    if move[0] == 'F' || move[0] == 'S'
      south += move[1..-1].to_i 
    elsif move[0] == 'N'
      north += move[1..-1].to_i
    elsif move[0] == 'E'
      east += move[1..-1].to_i  
    elsif move[0] == 'W'
      west += move[1..-1].to_i
    end  
  elsif facing == 2 # west
    if move[0] == 'F' || move[0] == 'W'
      west += move[1..-1].to_i 
    elsif move[0] == 'N'
      north += move[1..-1].to_i
    elsif move[0] == 'E'
      east += move[1..-1].to_i  
    elsif move[0] == 'S'
      south += move[1..-1].to_i
    end  
  elsif facing == 3 # north
    if move[0] == 'F' || move[0] == 'N'
      north += move[1..-1].to_i 
    elsif move[0] == 'W'
      west += move[1..-1].to_i
    elsif move[0] == 'E'
      east += move[1..-1].to_i  
    elsif move[0] == 'S'
      south += move[1..-1].to_i
    end  
  end
end

p (east-west).abs+(north-south).abs
