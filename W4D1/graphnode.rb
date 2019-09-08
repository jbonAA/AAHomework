class GraphNode

    attr_reader :value, :neighbors, :queue, :set

    def initialize(value)
        @value = value
        @neighbors = []
        @queue = []
        @set = []
    end

    def neighbors=(array)
        array.each do |node|
            self.neighbors << node
        end
    end

    def remove_neighbor(node)
        self.neighbors.shift
    end

    def inspect
        "<Queue-#{value}#{object_id}"
    end

    def bfs(starting_node, target_value)
        set = []
        queue = []

        set << starting_node unless set.include?(starting_node)
        queue << starting node unless queue.include?(starting_node)

        starting_node.neighbors.each do |node|
            unless set.include?(node)
                set << node
                queue << node
            end
        end

        first = queue.first
        return first if first.value == target_value
        queue.shift
        
        if queue.empty?
            return nil
        else
            bfs(queue.first, target_value)
        end
    end


    
end

bfs(f, "b")
