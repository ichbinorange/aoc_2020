data = File.open("test.txt").readlines.map(&:chomp)

# convert the data to hash datatype
data_hash = {}
data.each_with_index do |info, index|
  action, num = info.split(" ")
  data_hash[index] = [action, num.to_i]
end

def result(database)
  round_two = {}
  accumulator = 0
  pointer = 0
  while round_two 
    round_two[pointer] = true
    if database[pointer][0] == 'acc'
      accumulator += database[pointer][1] 
      pointer += 1
    elsif database[pointer][0] == 'nop'
        pointer += 1
    elsif database[pointer][0] == 'jmp'
      pointer += database[pointer][1] if database[pointer][1] != 0 
      return accumulator if database[pointer].nil?
      pointer += 1 if database[pointer][1] == 0 && pointer == 0
    end
    return false if round_two.key?(pointer) 
    return accumulator if database[pointer].nil?
  end
end

data_hash.each do |key, value|
  if value[0] == 'jmp'
    data_hash[key] = ['nop', value[1]]
    break if result(data_hash) 
    data_hash[key] = ['jmp', value[1]]
  elsif value[0] == 'nop'
    value[0] = 'jmp'
    break if result(data_hash) 
    data_hash[key] = ['nop', value[1]]
  end
end

p result(data_hash)
