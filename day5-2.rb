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

seat_hash = {}
(1..126).each do |seat|
  seat_column = 0
  while seat_column < 8
    seat_hash["#{seat}-#{seat_column}"] = true
    seat_column += 1
  end
end

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
  
  seat_hash.delete("#{row}-#{column}")
end

seat_hash.each do |key, value|
  row, column = key.split("-")
  seat_hash[key] = (row.to_i * 8)+column.to_i
end
p seat_hash

