class Node
    attr_accessor :key,:value,:next_node

    def initialize(ke,val)
        @key=ke
        @value=val
        @next_node=nil
    end
end