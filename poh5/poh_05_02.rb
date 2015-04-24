line_number = gets.to_i
result = [0] * 7

(0...line_number).each do |index|
	result[index % 7] += gets.to_i
end

puts result
