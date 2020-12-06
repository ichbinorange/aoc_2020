data = File.open("day6.txt").readlines.map(&:chomp)

# convert the data to hash datatype
data_hash = {}
each_group = []
group = 1
data.each do |info|
  if info == ""
    data_hash[group.to_s] = each_group.sort_by! {|element| element.length}
    group += 1
    each_group = []
  else
    each_group.push(info)
  end
end
# add the last piece of data to hash, it is missing in the loop because the fault of " if info == "" ".
data_hash[group.to_s] = each_group.sort_by! {|element| element.length}

yes_answers = 0
data_hash.each do |key, info|
  if info.length == 1
    yes_answers += info[0].length
  else
    step1_hash = {}
    info[0].split("").each do |info0_element|
      step1_hash[info0_element] = 1  
    end

    info[1..-1].each do |info_x|
      (info_x.split("") - (info_x.split("")-info[0].split(""))).each do |element|
        step1_hash[element] += 1
      end
    end
    yes_answers += step1_hash.values.count(info.length) 
  end
end

p yes_answers