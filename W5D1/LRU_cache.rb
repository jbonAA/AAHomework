require 'byebug'

class LRUCache

  attr_reader :cache, :size

    def initialize(number)
      @cache = []
      @size = number
    end

    def count
      cache.length
      # returns number of elements currently in cache
    end

    def add(el)
      # debugger
      return cache.pop if count > size
      if cache.include?(el)
        i = cache.index(el)
        cache.delete_at(i)
      else
        cache.unshift(el)
      end

    end
      # adds element to cache according to LRU principle
    

    def show
      check
      # shows the items in the cache, with the LRU item first
    end

    def [](index)
      cache[index]
    end

    private

    def check
      
      if count > size
        self[0...size]
      end
      self
    end
    # helper methods go here!

  end


    johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})
  p johnny_cache.show

#   johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]