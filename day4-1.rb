data = File.open("day4.txt").readlines.map(&:chomp)

# convert the data to hash datatype
data_hash = {}
each_info = []
tag = 1
data.each do |info|
  if info == ""
    data_hash[tag.to_s] = each_info
    tag += 1
    each_info = []
  else
    each_info.push(info)
  end
end
# add the last piece of data to hash, it is missing in the loop because the fault of " if info == "" ".
data_hash[tag.to_s] = each_info 

# convert the inner data to flatten array
data_hash.each do |key, info|
  arrange_data = []
  info.each do |pwd|
    arrange_data.push(pwd.split(" "))
  end
  arrange_data.flatten!
  data_hash[key] = arrange_data
end

# convert the inner data to hash datatype
data_hash.each do |key, info|
  pwd_hash = {}
  info.each do |pwd|
    item, value = pwd.split(":")
    pwd_hash[item] = value
  end
  data_hash[key] = pwd_hash
end

expected_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

valid_passports = 0
data_hash.each_value do |value|
  missing = expected_fields - value.keys 
  valid_passports += 1 if missing.empty? || missing == ["cid"]  
end

p valid_passports