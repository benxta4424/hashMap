require './lib/node_class'

class LinkedList

    def initialize
        @head=nil
    end

    def create_node(key,value)
        Node.new(key,value)
    end

    def prepend(key,value)
        new_node=create_node(key,value)
        new_node.next_node = @head
        @head=new_node
    end

    def to_s
        'Lista goala!' if @head.nil?

        current_node=@head
        elements=[]

        while current_node
            elements<<"#{current_node.key}:#{current_node.value}"
            current_node=current_node.next_node
        end

        elements
    end
    

end