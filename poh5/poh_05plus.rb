ANSWER = {
	:"1"  => [0, 0],
	:"2"  => [0, 1],
	:"3"  => [0, 2],
	:"4"  => [0, 3],
	:"5"  => [1, 0],
	:"6"  => [1, 1],
	:"7"  => [1, 2],
	:"8"  => [1, 3],
	:"9"  => [2, 0],
	:"10" => [2, 1],
	:"11" => [2, 2],
	:"12" => [2, 3],
	:"13" => [3, 0],
	:"14" => [3, 1],
	:"15" => [3, 2],
	:"*"  => [3, 3]
}

def parse_line(n)
	hash = {}

	n.times do |row_index|
		keys = gets.split(' ').map{|v| v.to_sym}
		keys.each_with_index {|key, column_index|
			hash[key] = [row_index, column_index]
		}
	end

	hash
end

def evaluate(hash)
	manhattan_distance = 0

	ANSWER.each_key do |key|
		if hash[key] == ANSWER[key]
			next
		else
			0.upto 1 do |n|
				manhattan_distance += (ANSWER[key][n] - hash[key][n]).abs
			end
		end
	end

	manhattan_distance
end

def select_hash(hashes)
	min = nil
	selected = 0
	hashes.each_with_index do |hash, index|
		if index == 0
			min = evaluate(hash)
		elsif min > evaluate(hash)
			selected = index
		end
	end

	puts hashes[selected][:moved]
	hashes[selected]
end

def next_hashes(hash)
	space_x, space_y = hash[:*]
	next_space = []
	result = []

	if 0 < space_x
		next_space.push [space_x - 1, space_y]
	end
	if space_x < 3
		next_space.push [space_x + 1, space_y]
	end
	if 0 < space_y 
		next_space.push [space_x, space_y - 1]
	end
	if space_y < 3
		next_space.push [space_x, space_y + 1]
	end

	next_space.each do |space|
		hash.each do |key, val|
			if val == space
				next_hash = Marshal.load(Marshal.dump(hash))
				next_hash[key] = [space_x, space_y]
				next_hash[:*]  = space
				next_hash[:moved] = key
				result.push next_hash
			end
		end
	end

	result
end

############## test #################

hash = parse_line 4
loop {
	hashes = next_hashes(hash)
	hash   = select_hash(hashes)
	break if evaluate(hash) == 0
}
