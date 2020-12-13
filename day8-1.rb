data = File.open("day8.txt").readlines.map(&:chomp)

# convert the data to hash datatype
data_hash = {}
data.each_with_index do |info, index|
  action, num = info.split(" ")
  data_hash[index] = [action, num.to_i]
end

round_two = {}
accumulator = 0
pointer = 0
while round_two
  round_two[pointer] = true
  if data_hash[pointer][0] == 'acc'
    accumulator += data_hash[pointer][1] 
    pointer += 1
  elsif data_hash[pointer][0] == 'jmp'
    pointer += data_hash[pointer][1]
  elsif data_hash[pointer][0] == 'nop'
    pointer += 1
  end
  break if round_two.key?(pointer)
end

p accumulator