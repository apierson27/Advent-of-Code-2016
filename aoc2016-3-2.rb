columns = [[],[],[]]
input = Array.new
valid = Array.new
solution = Array.new

File.open('aoc2016-3-1-input.txt') do |text|
	text.each do |line|
		line = line.split(' ')
		line.each_index do |i| columns[i] << line[i] end
	end
end

# for each column, split its values into sub-arrays of 3 and append to input.
columns.each do |x|
 	x.each_slice(3) do |y| input << y end
end


input.each do |tri|

# 	# map each index to an array if the sum of it and the following index
# 	# are greater than the 3rd, then check if all three indicies were mapped,
# 	# and if so, add them to the solution count
  	valid = tri.each_index.select do |i|
  		tri[i-2].to_i + tri[i-1].to_i > tri[i].to_i
  	end

  	solution << valid if valid.length == 3
 end

 puts solution.length
