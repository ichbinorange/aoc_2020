data = []
File.open("day9.txt").each do |line|
  data.push(line.to_i)
end

def find_num(data)
  first_key = 0
  pointer = 25
  while pointer < data.length
    inner_check_point = false
    data[first_key...pointer].each do |num|
      if data[first_key...pointer].include?(data[pointer] - num) && (num * 2 != data[pointer])
        inner_check_point = true 
        break
      end
    end
    return data[pointer] if inner_check_point == false
    first_key += 1
    pointer += 1
    inner_check_point = false
  end
end

p find_num(data)