def merge_sort(array)
	n = array.size / 2
	if array.size == 1
		return array
	else
		s1 = merge_sort(array[0...n])
		s2 = merge_sort(array[n..-1])
		return form_sorted(s1, s2)
	end
end

def form_sorted(array1, array2)
	sorted = []
	if array1.size == 0
		return array2
	elsif array2.size == 0
		return array1
	end
	if array1[0] <= array2[0]
		sorted << array1[0]
		sorted << form_sorted(array1[1..-1], array2[0..-1])
	else
		sorted << array2[0]
		sorted << form_sorted(array1[0..-1], array2[1..-1])
	end
	return sorted.flatten
end

print merge_sort([1])
