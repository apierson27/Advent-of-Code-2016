row_one = [1,2,3]
row_two = [4,5,6]
row_three = [7,8,9]

keypad = [row_one, row_two, row_three]

input = Array.new
solution = Array.new

File.open('aoc2016-2-1-input.txt') do |text|
	text.each do |line| input << line end
end

input.each do |step|
	row = 0
	column = 0
	step.split('').each do |direction|
		row += 1 if direction == 'D' unless row == 2
		row -= 1 if direction == 'U' unless row == 0
		column += 1 if direction == 'R' unless column == 2
		column -= 1 if direction =='L' unless column == 0
	end
	solution << keypad[row][column]
end

puts solution