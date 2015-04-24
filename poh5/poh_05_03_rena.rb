column_count, row_count, range_count = gets.split(' ').map{|v| v.to_i}

table = []
(0...row_count).each {|n|
	row = gets.split(' ').map{|v| v.to_i}
	table.push row
}

cache = ''
result = 0

(0...range_count).each {|n|
	x_1, y_1, x_2, y_2 = gets.split(' ').map{|v| v.to_i}
	
	(x_1..x_2).each {|x|
		(y_1..y_2).each {|y|
			if cache.include? "(#{x},#{y})"
				next
			else
				cache += "(#{x},#{y}) "
				result += table[y-1][x-1]
			end
		}
	}
}
puts result
