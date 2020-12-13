data = File.open("day7.txt").readlines.map(&:chomp)

# convert the data to hash datatype
data_hash = {}
data.each do |info|
  key, string_contains = info.split("contain")
  key.sub!(/bag/, "bags") if key[-4..-1].match?(" bag")

  contains = string_contains[0..-2].split(",")
  contains.each do |bag|
    bag.sub!(/bag/, "bags") if bag[-4..-1].match?(" bag")
  end

  data_hash[key.strip] = contains.map {|bag| bag.strip} 
end

# convert inner layer to hash datatype
data_hash.each do |key, inner_bags|
  inner_layer = {}  
  inner_bags.each do |bag|
    divide_num = bag.index(" ")
    inner_layer[bag[(divide_num+1)..-1]] = bag[0...divide_num].to_i
  end
  data_hash[key] = inner_layer
end

# Find shiny gold bag's outer bag
shiny_gold_bag = []
data_hash.each do |key, inner_bags|
  shiny_gold_bag.push(key) if inner_bags.has_key?("shiny gold bags")
end
shiny_gold_bag.uniq!

def count_bags(layer, database)
  outer_bag = []
  layer.each do |shiny_bag|
    database.each do |key, inner_bags|
      outer_bag.push(key) if inner_bags.has_key?(shiny_bag)
    end
  end
  return outer_bag.uniq
end

outer_bag = []
checking_bag = shiny_gold_bag
while outer_bag
  recursive_check = count_bags(checking_bag, data_hash)
  outer_bag = outer_bag + recursive_check
  break if recursive_check.empty?
  checking_bag = recursive_check
end

p (shiny_gold_bag+outer_bag).uniq.length

