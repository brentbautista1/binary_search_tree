class Node
	attr_accessor :right_child, :left_child, :parent_node, :value

	def initialize(value, parent_node = nil, child_node_left = nil, child_node_right = nil)
		@value = value
		@right_child = child_node_right
		@left_child = child_node_left
		@parent_node = parent_node
	end
end
class BST
	attr_accessor :root

	def initialize(array, root = array[0])
		@array = array
		@root = Node.new(root)
		@queue = []
		@stack = []
		build_tree(@array)
	end

	def build_tree(array_of_data, parent_node = nil)
		size = array_of_data.size
		n = 1
		while(n<size)
			add_node(array_of_data[n], @root)
			n += 1
		end
	end

	def add_node(value, root_node = nil)
		if root_node.left_child.nil? and value < root_node.value
			node = Node.new(value, root_node)
			root_node.left_child = node
		elsif root_node.right_child.nil? and value > root_node.value
			node = Node.new(value, root_node)
			root_node.right_child = node
		else
			if value < root_node.value
				add_node(value, root_node.left_child)
			elsif value > root_node.value
				add_node(value, root_node.right_child)
			end
		end
	end

	def breadth_first_search(target_value, root = @root)
		return root if root.value == target_value
		
		@queue << root.left_child unless root.left_child.nil?
		@queue << root.right_child unless root.right_child.nil?
		
		return nil if @queue.size == 0 and root.value != target_value

		root = breadth_first_search(target_value, @queue.shift)
		@queue = []
		return root
	end

	def depth_first_search(target_value, root = @root)
		@stack << root

		while @stack.size != 0
			current_node = @stack.pop
			if current_node.value == target_value
				return current_node
			else
				@stack << current_node.left_child unless current_node.left_child.nil?
				@stack << current_node.right_child unless current_node.right_child.nil?
			end
		end

		return nil
	end

	def dfs_rec(target_value, current_node = @root)
		return current_node if current_node.value == target_value
		return nil if current_node.left_child.nil? and current_node.right_child.nil?
		query_l = dfs_rec(target_value, current_node.left_child) unless current_node.left_child.nil?
		query_r = dfs_rec(target_value, current_node.right_child) unless current_node.right_child.nil?

		unless query_r.nil?
			return query_r
		end
		unless query_l.nil?
			return query_l
		end
		
		return nil
		end
end

tree = BST.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts tree.breadth_first_search(23).left_child.value
puts tree.breadth_first_search(8).right_child.value
puts tree.depth_first_search(23).left_child.value
puts tree.depth_first_search(8).right_child.value
puts tree.dfs_rec(23).left_child.value
puts tree.dfs_rec(8).right_child.value