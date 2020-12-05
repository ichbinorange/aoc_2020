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
  checking_points = 0
  missing = expected_fields - value.keys 
  if missing.empty? || missing == ["cid"]  
    checking_points += 1 if (1920..2002).include?(value["byr"].to_i)
    checking_points += 1 if (2010..2020).include?(value["iyr"].to_i)
    checking_points += 1 if (2020..2030).include?(value["eyr"].to_i)

    if value["hgt"].include?("cm")
      value["hgt"].slice!("cm")
      checking_points += 1 if (150..193).include?(value["hgt"].to_i)
    elsif value["hgt"].include?("in")
      value["hgt"].slice!("in")
      checking_points += 1 if (59..76).include?(value["hgt"].to_i)
    end

    checking_points += 1 if value["hcl"].length == 7 && value["hcl"].match?(/#[0-9a-f]/)
    checking_points += 1 if ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(value["ecl"])
    checking_points += 1 if value["pid"].length == 9 && value["pid"].match?(/[0-9]/)
    
    if checking_points == 7
      valid_passports += 1
      checking_points = 0
    end
  end  
end

p valid_passports