column, row = gets.split(' ').map {|v| v.to_i}

columns = []
(0...column).each {|n|
	columns[n] = []
}

(0...row).each {|n|
	input = gets.split(' ').map {|v| v.to_i}
	input.each_with_index {|value, index|
		if value != 2
			columns[index].push value
		end
	}
}

columns.each_with_index {|column_array, index|
	columns[index] = [0] * (row - column_array.size) + column_array
}

(0...row).each do |n|
	result = ''

	columns.each {|column_array|
		result += "#{column_array[n]} "
	}
	puts result.chop
end
