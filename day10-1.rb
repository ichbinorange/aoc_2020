data = []
File.open("day10.txt").each do |line|
  data.push(line.to_i)
end
data.sort!

one_jolt = 1
three_jolt = 1
data.each_with_index do |num, index|
  one_jolt += 1 if (data[index] - data[index-1]) == 1
  three_jolt += 1 if (data[index] - data[index-1]) == 3
end
p one_jolt * three_jolt
