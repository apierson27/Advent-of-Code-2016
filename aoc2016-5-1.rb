require 'digest'

input = 'reyedfim'
solution = ''
index = 0

until solution.length == 8 do
	hash = Digest::MD5.hexdigest(input+index.to_s)
	solution += hash.slice(5) if hash.start_with?('00000')
	index += 1
end

puts solution