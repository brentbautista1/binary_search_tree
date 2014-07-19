def fibs(number)
	return 0 if number == 0	
	return 1 if number == 1
	return fibs(number-1) + fibs(number-2)
end

def fibs_iter(number)
	return 0 if number == 0
	return 1 if number == 1

	n = 0
	n_1 = 1
	counter = 1
	result = 1
	while counter != number
		result = n + n_1
		n, n_1 = n_1, result
		counter += 1
	end
	return result
end

puts fibs_iter 50
puts fibs 50


