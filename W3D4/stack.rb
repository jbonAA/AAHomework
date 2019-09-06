class Stack
    def initialize(stack)
        raise TypeError, "stack ivar is not an array" unless stack.class == Array
        @stack = stack
    end
    

    def push(el)
        @stack << el
    end

    def pop
        @stack[0...-1]
    end
    
    def peek
        @stack[-1]
    end
end
