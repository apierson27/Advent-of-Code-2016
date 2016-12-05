input = Array.new
valid = Array.new
solution = Array.new

File.open('aoc2016-3-1-input.txt') do |text|
	text.each do |line| input << line end
end

input.each do |line|
	tri = line.strip!.split

	# map each index to an array if the sum of it and the following index
	# are greater than the 3rd, then check if all three indicies were mapped,
	# and if so, add them to the solution count
 	valid = tri.each_index.select do |i|
 		tri[i-2].to_i + tri[i-1].to_i > tri[i].to_i
 	end

 	solution << valid if valid.length == 3
end

puts solution.length
