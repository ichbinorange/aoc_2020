data = []
File.open("day10.txt").each do |line|
  data.push(line.to_i)
end
data.unshift(0)
data.sort!

pointer = 0
distinct_ways = 1
while pointer < (data.length - 1)
  if data[pointer + 4] == (data[pointer] + 4)
    distinct_ways *= 7
    pointer += 4
  elsif data[pointer + 3] == (data[pointer] + 3) && data[pointer + 4] != (data[pointer] + 4)
    distinct_ways *= 4
    pointer += 3
  elsif data[pointer + 2] == (data[pointer] + 2) && data[pointer + 3] != (data[pointer] + 3)
    distinct_ways *= 2
    pointer += 2
  elsif data[pointer + 1] == (data[pointer] + 1) && data[pointer + 2] != (data[pointer] + 2)
    pointer += 1
  elsif data[pointer+1] == (data[pointer] + 3)
    pointer += 1
  end
end

p distinct_ways