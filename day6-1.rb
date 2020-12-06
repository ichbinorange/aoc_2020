data = File.open("day6.txt").readlines.map(&:chomp)

# convert the data to hash datatype
data_hash = {}
each_group = []
group = 1
data.each do |info|
  if info == ""
    data_hash[group.to_s] = each_group
    group += 1
    each_group = []
  else
    each_group.push(info)
  end
end
# add the last piece of data to hash, it is missing in the loop because the fault of " if info == "" ".
data_hash[group.to_s] = each_group 

yes_answers = 0
# convert the inner data to flatten array
data_hash.each do |key, info|
  arrange_data = []
  info.each do |pwd|
    arrange_data.push(pwd.split(" "))
  end
  yes_answers += arrange_data.flatten!.join.split("").uniq.length
end

p yes_answers