require './lib/node_class'

class LinkedList

    def initialize
        @head=nil
        @nr_of_keys=0
    end

    def head
        @head
    end

    def create_node(key,value)
        @nr_of_keys+=1
        Node.new(key,value)
    end

    def nr_of_keys
        @nr_of_keys
    end

    def all_keys
        curren_node=@head
        total_keys=[]
        while curren_node
            total_keys<<"#{curren_node.key}->"
            curren_node=curren_node.next_node
        end

        total_keys
    end

    def all_values
        curren_node=@head
        values=[]
        while curren_node
            values<<"#{curren_node.value}->"
            curren_node=curren_node.next_node
        end

        values
    end

    def prepend(key,value)
        new_node=create_node(key,value)
        new_node.next_node = @head
        @head=new_node
    end

    def has_key?(key)   
        current_node=@head

        while current_node
            if current_node.key == key 
                return true
            end
            current_node=current_node.next_node
        end
        false
    end

    def find_key(key)
        current_node=@head
        while current_node
            return current_node.value if current_node.key == key
            current_node=current_node.next_node
        end
        nil
    end

    def rm_key(key) 
        current_node=@head
        prev_node=nil
        
        return nil if current_node.nil?

        if current_node.key == key 
            @head=current_node.next_node
            return current_node.value
        end

        while current_node
            if current_node.key == key 
                prev_node.next_node=current_node.next_node
                return current_node.value
            end
            prev_node=current_node
            current_node=current_node.next_node
        end

        'The key doesnt exist!'
    end

    def to_s
        'Lista goala!' if @head.nil?

        current_node=@head
        elements=[]

        while current_node
            elements<<"#{current_node.key}:#{current_node.value}"
            current_node=current_node.next_node
        end

        elements.join(' -> ')
    end
    

end