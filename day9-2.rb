data = []
File.open("day9.txt").each do |line|
  data.push(line.to_i)
end

def weakness(check_num, data)
  check_point = false
  start_point = 0
  while start_point < data.length
    temp_sum = 0
    small_num = data[start_point]
    large_num = data[start_point]
    data[start_point..-1].each do |num|
      temp_sum += num
      small_num = num if num < small_num
      large_num = num if num > large_num
      break if temp_sum > check_num
      if temp_sum == check_num
        check_point = true
        break
      end
    end
    return (large_num + small_num) if check_point == true
    start_point += 1
    check_point = false
  end
end

check_num = 26134589
p weakness(check_num, data)
