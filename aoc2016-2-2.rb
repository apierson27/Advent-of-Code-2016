row_one = [nil, nil, 1, nil, nil]
row_two = [nil, 2, 3, 4, nil]
row_three = [5,6,7,8,9]
row_four = [nil, 'A','B','C', nil]
row_five = [nil, nil, 'D', nil, nil]

keypad = [row_one, row_two, row_three, row_four, row_five]

input = Array.new
solution = Array.new

File.open('aoc2016-2-1-input.txt') do |text|
	text.each do |line| input << line end
end

# input= ['ULL',
# 'RRDDD',
# 'LURDL',
# 'UUUUD']

input.each do |step|
	# start at the 5 key
	row = 2
	column = 0
	# puts "start step #{row} #{column}"
	step.split('').each do |direction|
		row += 1 if direction == 'D' unless row == 4 or keypad[row+1][column] == nil
		row -= 1 if direction == 'U' unless row == 0 or keypad[row-1][column] == nil
		column += 1 if direction == 'R' unless column == 4 or keypad[row][column+1] == nil
		column -= 1 if direction == 'L' unless column == 0 or keypad[row][column-1] == nil
		# puts "#{direction} #{row} #{column} #{keypad[row][column].inspect}"
	end
	solution << keypad[row][column]
end

puts solution.inspect