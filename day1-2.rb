data = File.open("day1.txt").readlines.map(&:chomp)

hash_data = {}
data.each do |line|
   hash_data[line] = true
end

num1 = 0
num2 = 0
num3 = 0
hash_data.each_key do |key1|
  hash_data.each_key do |key2|  
    if hash_data.key?((2020-key1.to_i-key2.to_i).to_s)
      num1 = key1.to_i
      num2 = key2.to_i
      num3 = 2020-key1.to_i-key2.to_i
      break
    end
  end
end

p num1 * num2 * num3