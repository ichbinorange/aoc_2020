data = File.open("day1.txt").readlines.map(&:chomp)

hash_data = {}
data.each do |line|
   hash_data[line] = true
end

num1 = 0
num2 = 0
hash_data.each_key do |key|
  if hash_data.key?((2020-key.to_i).to_s)
    num1 = key.to_i
    num2 = 2020-key.to_i
    break
  end
end

p num1 * num2