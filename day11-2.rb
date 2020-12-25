data = File.open("day11.txt").readlines.map(&:chomp)
first_step = data.map {|row| row.split('').map {|col| col = '#' if col != '.'}}

def occupied_or_empty(seats, symbol)
  seats_to_change = []
  # check if to change the seat condition and label it
  seats.each_with_index do |row, index|
    seats[index].each_with_index do |col, index2|
      # seats at four corners will always be taken
      if (index == 0 && index2 == 0) || (index == 0 && index2 == seats[index].length - 1) || ((index == seats.length - 1) && index2 == 0) || ((index == seats.length - 1) && (index2 == seats[index].length - 1))
        next
      elsif col != nil
        if symbol == "L"
          temp_seat = seat_circle(index, index2, seats)
        elsif symbol == "#"
          temp_seat = seat_circle2(index, index2, seats)
        end
        seats_to_change.push([index, index2]) if temp_seat == "c"
      end
    end
  end
  # change the labeled seat
  seats_to_change.each do |seat|
    seats[seat[0]][seat[1]] = symbol
  end
  return seats
end

def seat_circle(row, col, seats)
  more_than_5 = 0
  if row == 0 
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, 1, seats) == "#" 
  elsif row == (seats.length - 1)
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#"
    more_than_5 += 1 if see_diagonal(row, col, -1, 1, seats) == "#" 
  elsif col == 0 
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#"
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, 1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, 1, seats) == "#" 
  elsif col == (seats[0].length - 1)
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#"
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, -1, seats) == "#" 
  else
    more_than_5 += 1 if see_diagonal(row, col, -1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#"
    more_than_5 += 1 if see_diagonal(row, col, -1, 1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, 1, seats) == "#" 
  end
  more_than_5 >= 5 ? (return "c") : (return "no")
end

def seat_circle2(row, col, seats)
  more_than_5 = 0
  if row == 0 
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, 1, seats) == "#" 
  elsif row == (seats.length - 1)
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, 1, seats) == "#" 
  elsif col == 0 
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, 1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, 1, seats) == "#" 
  elsif col == (seats[0].length - 1)
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, -1, seats) == "#" 
  else
    more_than_5 += 1 if see_diagonal(row, col, -1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, -1, 1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, -1, seats) == "#" 
    more_than_5 += 1 if see_col(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, -1, seats) == "#" 
    more_than_5 += 1 if see_row(row, col, 1, seats) == "#" 
    more_than_5 += 1 if see_diagonal(row, col, 1, 1, seats) == "#" 
  end
  more_than_5 < 1 ? (return "c") : (return "no")
end

def see_row(row, col, direction, seats)
  row += direction
  while row >= 0 && row < seats.length && seats[row][col].nil? 
    row += direction
  end
  
  if row < 0
    return seats[row+1][col]
  elsif row >= seats.length
    return seats[row-1][col]
  else
    return seats[row][col]
  end
end

def see_col(row, col, direction, seats)
  col += direction
  while col >= 0 && col < seats[0].length && seats[row][col].nil? 
    col += direction
  end

  if col < 0
    return seats[row][col+1]
  elsif col >= seats[0].length
    return seats[row][col-1]
  else
    return seats[row][col]
  end
end

def see_diagonal(row, col, r_direction, c_direction, seats)
  row += r_direction
  col += c_direction
  while col >= 0 && col < seats[0].length && row >= 0 && row < seats.length && seats[row][col].nil? 
    row += r_direction
    col += c_direction
  end
  
  if r_direction == 1 && c_direction == 1 && (col >= seats[0].length || row >= seats.length)
    return seats[row-1][col-1]
  elsif r_direction == 1 && c_direction == -1 && (row >= seats.length || col < 0)
    return seats[row-1][col+1]
  elsif r_direction == -1 && c_direction == 1 && (col >= seats[0].length || row < 0)
    return seats[row+1][col-1]
  elsif r_direction == -1 && c_direction == -1 && (col < 0 || row < 0)
    return seats[row+1][col+1]
  else
    return seats[row][col]
  end
end

empty = occupied_or_empty(first_step, "L")

check_point = false
until check_point
  occupied = occupied_or_empty(empty, "#")
  temp1 = occupied.map(&:clone)
  empty = occupied_or_empty(occupied, "L")

  break_point = true
  occupied.length.times do |row|
    if temp1[row] != empty[row]
      break_point = false 
      break
    end
  end
  check_point = true if break_point == true
end

occupied_seats = 0
empty.each do |row|
  row.each do |col|
    occupied_seats += 1 if col == "#"
  end
end

p occupied_seats