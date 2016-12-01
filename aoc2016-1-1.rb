start = [0,0] # x,y coordinates
dirs = [0,1,2,3] # 0 = North per the start on the exercise, 1 = East, etc.
facing = 0

steps = 'L4, L3, R1, L4, R2, R2, L1, L2, R1, R1,
L3, R5, L2, R5, L4, L3, R2, R2, L5, L1, R4, L1, R3, L3, R5, R2, L5, R2, R1, R1,
L5, R1, L3, L2, L5, R4, R4, L2, L1, L1, R1, R1, L185, R4, L1, L1, R5, R1, L1,
L3, L2, L1, R2, R2, R2, L1, L1, R4, R5, R53, L1, R1, R78, R3, R4, L1, R5, L1,
L4, R3, R3, L3, L3, R191, R4, R1, L4, L1, R3, L1, L2, R3, R2, R4, R5, R5, L3,
L5, R2, R3, L1, L1, L3, R1, R4, R1, R3, R4, R4, R4, R5, R2, L5, R1, R2, R5, L3,
L4, R1, L5, R1, L4, L3, R5, R5, L3, L4, L4, R2, R2, L5, R3, R1, R2, R5, L5, L3,
R4, L5, R5, L3, R1, L1, R4, R4, L3, R2, R5, R1, R2, L1, R4, R1, L3, L3, L5, R2,
R5, L1, L4, R3, R3, L3, R2, L5, R1, R3, L3, R2, L1, R4, R3, L4, R5, L2, L2, R5,
R1, R2, L4, L4, L5, R3, L4'

steps = steps.split(',').each do |x| x.strip! end # steps to array

steps.each do |step|
	step[0] == "L" ? facing -= 1 : facing += 1 # turn left or right accordingly
	case facing % 4
	when 0
		start[1] += step[1..-1].to_i # move north
	when 1
		start[0] += step[1..-1].to_i # move east
	when 2
		start[1] -= step[1..-1].to_i # move south
	when 3
		start[0] -= step[1..-1].to_i # move west
	else
		puts "Unexpected value #{step[1..-1]} #{facing}"
	end
end
hq =  start.inject {|sum, n| sum + n }
puts hq.abs
