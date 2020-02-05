require 'set'

class Vertex
  attr_accessor :child_vertexes, :word_ids, :char, :fallback_vertex, :parent_vertex

  def initialize(char:nil, parent_vertex:nil)
    @child_vertexes = {}
    @word_ids = Set.new()
    @char = char
    @parent_vertex = parent_vertex
  end
end

class Trie
  attr_accessor :root
  
  def initialize
    @root = Vertex.new()
    @are_fallbacks_calculated = false
  end

  def add_string(s, id)
    current_vertex = @root
    str.length.times do |i|
      current_char = s[i]
      if current_vertex.child_vertexes[current_char].nil?
        current_vertex.child_vertexes[current_char] = Vertex.new(parent_vertex: current_vertex, char: c)
      end
      current_vertex = current_vertex.child_vertexes[current_char]
    end
    current_vertex.word_ids.add(id)
    @are_fallbacks_calculated = false
  end

  def calculate_fallback(vertex)
    if vertex == @root || vertex.parent_vertex == @root
      vertex.fallback_vertex = @root
      return
    end
    current_fallback_vertex = vertex.parent_vertex.fallback_vertex
    char = vertex.parent_vertex.char

    loop do 
      unless current_fallback_vertex.child_vertexes[char].nil?
        vertex.fallback_vertex = current_fallback_vertex.child_vertexes[char]
        break
      end

      if current_fallback_vertex == @root
        vertex.fallback_vertex = @root
        break
      end

      current_fallback_vertex = current_fallback_vertex.fallback_vertex
    end
  end

  def set_all_fallback_vertexes
    q = Queue.new
    q << @root
    while q.length > 0 do
      current_vertex = q.pop
      calculate_fallback(current_vertex)
      current_vertex.child_vertexes.map do |_, value|
        q << value
      end
    end
    @are_fallbacks_calculated = true
  end

end
