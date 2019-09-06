class Map
    def initialize(array)
        raise TypeError unless array.all? { |el| el.class == Array && el.length == 2 }
        @array = array
    end

    def set(key, value)
        @array.map { |subArr| subArr[1] = value if subArr[0] == key }
    end

    def get(key)
        @array.select { |subArr| subArr if subArr[0] == key }
    end

    def delete(key)
        @array.each_with_index do |pair, i|
            @array.delete_at(i) if pair[0] == key
        end
    end

    def show
        @array
    end
end


      