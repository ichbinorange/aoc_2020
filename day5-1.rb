data = File.open("day5.txt").readlines.map(&:chomp)

def row(fb, r_num1, r_num2, idx)
  if fb == "F"
    r_num1 = r_num1
    r_num2 = (r_num1+r_num2)/2
  else
    r_num1 = (r_num1+r_num2)/2 + 1
    r_num2 = r_num2
  end
  return r_num1, r_num2
end

def column(lr, c_num1, c_num2, idx)
  if lr == "L"
    c_num1 = c_num1
    c_num2 = (c_num1+c_num2)/2
  else
    c_num1 = (c_num1+c_num2)/2 + 1
    c_num2 = c_num2
  end
  return c_num1, c_num2
end

highest_seat_id = 0
row = 0
column = 0
data.each do |seat|
  idx = 0
  r_num1, r_num2 = 0, 127
  while idx < 7
    r_num1, r_num2 = row(seat[idx], r_num1, r_num2, idx)
    idx += 1
  end
  row = r_num1

  c_num1, c_num2 = 0, 7
  while idx >= 7 && idx < 10
    c_num1, c_num2 = column(seat[idx], c_num1, c_num2, idx)
    idx += 1
  end

  column = c_num1
  
  highest_seat_id = (row * 8)+column if (row * 8)+column > highest_seat_id
end
p highest_seat_id

