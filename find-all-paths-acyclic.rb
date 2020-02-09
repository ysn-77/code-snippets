require 'set'

class DirectedGraph
  def initialize(edge_pairs)
 		@adjacency_list = {}
    edge_pairs.each do |pair|
    	@adjacency_list[pair.first] = Set.new if @adjacency_list[pair.first].nil?
    	@adjacency_list[pair.last] = Set.new if @adjacency_list[pair.last].nil?
    	@adjacency_list[pair.first].add pair.last
    end
	end

  def paths_between(starting_node, target_node)
   	@found_paths = []
   	find_paths(starting_node, target_node)
   	@found_paths
  end

  private

  # assumes that the graph is acyclic
  def find_paths(current_node, target_node, current_path=[])
  	current_path.push(current_node)
  	if current_node == target_node
  		@found_paths.push(current_path.dup)
  	else
  		@adjacency_list[current_node].each do |child|
  			find_paths(child, target_node, current_path)
  		end
  	end
  	current_path.pop
  end
end


33

end

34

​
def paths_between(node1, node2, edge_pairs)
	graph = DirectedGraph.new(edge_pairs)
	graph.paths_between(node1, node2)
end

p paths_between(1, 4, [[1,2], [1,3], [2,4], [3, 4]])
