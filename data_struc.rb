class Node
	attr_accessor :right_child, :left_child

	def initialize(node_value, child_node_right = nil, child_node_left = nil)
		@node_value = node_value
		@right_child = child_node_right
		@left_child = child_node_left
	end
end

def build_tree(array_of_data)
	size = array_of_data.size
	return nil if size == 1
	left_child = array_of_data[size/4]
	right_child = array_of_data[size*3/4]
	root_node = Node.new(array_of_data[size/2], right_child, left_child)
	build_tree()
end