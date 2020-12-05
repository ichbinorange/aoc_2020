data = File.open("day2.txt").readlines.map(&:chomp)

split_data = data.map {|line| line.split(" ")}
split_count = split_data.map {|line| [line[0].split("-"),line[1],line[2]]}
split_pwd = split_count.map {|line| [line[0],line[1].delete(":"),line[2]]}

valid_pwd = 0
split_pwd.each do |pwd|
  if (pwd[0][0].to_i..pwd[0][1].to_i).include?(pwd[2].count(pwd[1]))
    valid_pwd += 1
  end
end
p valid_pwd