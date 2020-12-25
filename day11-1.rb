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
  more_than_4 = 0
  if row == 0 
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row+1][col-1] == "#" 
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row+1][col+1] == "#" 
  elsif row == (seats.length - 1)
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row-1][col-1] == "#" 
    more_than_4 += 1 if seats[row-1][col] == "#"
    more_than_4 += 1 if seats[row-1][col+1] == "#" 
  elsif col == 0 
    more_than_4 += 1 if seats[row-1][col] == "#"
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row-1][col+1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row+1][col+1] == "#" 
  elsif col == (seats[0].length - 1)
    more_than_4 += 1 if seats[row-1][col] == "#"
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row-1][col-1] == "#" 
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row+1][col-1] == "#" 
  else
    more_than_4 += 1 if seats[row-1][col-1] == "#" 
    more_than_4 += 1 if seats[row-1][col] == "#"
    more_than_4 += 1 if seats[row-1][col+1] == "#" 
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row+1][col-1] == "#" 
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row+1][col+1] == "#" 
  end
  more_than_4 >= 4 ? (return "c") : (return "no")
end

def seat_circle2(row, col, seats)
  more_than_4 = 0
  if row == 0 
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row+1][col-1] == "#" 
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row+1][col+1] == "#" 
  elsif row == (seats.length - 1)
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row-1][col-1] == "#" 
    more_than_4 += 1 if seats[row-1][col] == "#" 
    more_than_4 += 1 if seats[row-1][col+1] == "#" 
  elsif col == 0 
    more_than_4 += 1 if seats[row-1][col] == "#" 
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row-1][col+1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row+1][col+1] == "#" 
  elsif col == (seats[0].length - 1)
    more_than_4 += 1 if seats[row-1][col] == "#" 
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row-1][col-1] == "#" 
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row+1][col-1] == "#" 
  else
    more_than_4 += 1 if seats[row-1][col-1] == "#" 
    more_than_4 += 1 if seats[row-1][col] == "#" 
    more_than_4 += 1 if seats[row-1][col+1] == "#" 
    more_than_4 += 1 if seats[row][col-1] == "#" 
    more_than_4 += 1 if seats[row][col+1] == "#" 
    more_than_4 += 1 if seats[row+1][col-1] == "#" 
    more_than_4 += 1 if seats[row+1][col] == "#" 
    more_than_4 += 1 if seats[row+1][col+1] == "#" 
  end
  more_than_4 < 1 ? (return "c") : (return "no")
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