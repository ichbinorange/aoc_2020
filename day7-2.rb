# Haven't had the skills to create and read the graph data structure automatically, now I could only manually do it. 
# Hope next year I could write a better code for it!

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

# formats inner bags 
def inner_bags(layer, database)
  layer.each do |bag, value1|
    inner_bags = {}
    if bag != "other bags"
      database[bag].each do |inner_bag, value2|
        inner_bags[inner_bag] = [value2]
      end
    end
    value1.push(inner_bags)
  end
  return layer
end

# Find shiny gold bag's inner bags
shiny_gold_bag = {}
data_hash["shiny gold bags"].each do |key, value|
  shiny_gold_bag[key] = [value]
end

# formats shiny gold bag's inner bags
inner1 = inner_bags(shiny_gold_bag, data_hash)

# Create the graph data structure
inner1.each do |key1, value1|
  value1[1] = inner_bags(value1[1], data_hash)
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1] = inner_bags(value2[1], data_hash)
  end
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1].each do |key3, value3|
      value3[1] = inner_bags(value3[1], data_hash)
    end
  end
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1].each do |key3, value3|
      value3[1].each do |key4, value4|
        value4[1] = inner_bags(value4[1], data_hash)
      end
    end
  end
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1].each do |key3, value3|
      value3[1].each do |key4, value4|
        value4[1].each do |key5, value5|
          value5[1] = inner_bags(value5[1], data_hash)
        end
      end
    end
  end
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1].each do |key3, value3|
      value3[1].each do |key4, value4|
        value4[1].each do |key5, value5|
          value5[1].each do |key6, value6|
            value6[1] = inner_bags(value6[1], data_hash)
          end
        end
      end
    end
  end
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1].each do |key3, value3|
      value3[1].each do |key4, value4|
        value4[1].each do |key5, value5|
          value5[1].each do |key6, value6|
            value6[1].each do |key7, value7|
              value7[1] = inner_bags(value7[1], data_hash)
            end
          end
        end
      end
    end
  end
end

inner1.each do |key1, value1|
  value1[1].each do |key2, value2|
    value2[1].each do |key3, value3|
      value3[1].each do |key4, value4|
        value4[1].each do |key5, value5|
          value5[1].each do |key6, value6|
            value6[1].each do |key7, value7|
              value7[1].each do |key8, value8|
                value8[1] = inner_bags(value8[1], data_hash)
              end
            end
          end
        end
      end
    end
  end
end

# Based on the graph data structure to count the total bags
total_bags = 0
inner1.each do |key1, value1|
  total_value1 = 0
  total_value2 = 0
  value1[1].each do |key2, value2|
    total_value3 = 0
    unless value2[1].empty?
      value2[1].each do |key3, value3|
        total_value4 = 0
        unless value3[1].empty?
          value3[1].each do |key4, value4|
            total_value5 = 0
            unless value4[1].empty?
              value4[1].each do |key5, value5|
                total_value6 = 0
                unless value5[1].empty?
                  value5[1].each do |key6, value6|
                    total_value7 = 0
                    unless value6[1].empty?
                      value6[1].each do |key7, value7|
                        total_value8 = 0
                        unless value7[1].empty?
                          value7[1].each do |key8, value8|
                            total_value9 = 0
                            unless value8[1].empty?
                              value8[1].each do |key9, value9|
                                total_value9 += value9[0]
                              end
                              total_value8 += value8[0] *(1+total_value9)
                            end
                          end
                          total_value7 += value7[0] * (1+ total_value8) 
                        end
                      end
                      total_value6 += value6[0] * (1+ total_value7) 
                    end
                  end
                  total_value5 += value5[0] * (1+total_value6) 
                end
              end
              total_value4 += value4[0] * (1+total_value5) 
            end
          end
          total_value3 += value3[0] * (1+ total_value4)
        end
      end
      total_value2 += value2[0] * (1+total_value3) 
    end
  end
  total_value1 += value1[0] * (1+total_value2) 
  total_bags += total_value1
end

p total_bags

