class Queue
    def initialize(array)
        raise TypeError, "ivar is not an array" unless array.class == Array
        @array = array
    end

    def dequeue
        @array.shift
    end

    def enqueue(el)
        @array.push(el)

    end

    def peek
        @array[0]
    end
end