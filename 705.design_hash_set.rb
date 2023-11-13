# approach: linked list and array
#
# time: O(1) more as an average case we can it could degrade to O(n) 
#
# space: O(n) where n is the number of unique keys
#
# notes: I was going down the correct route but 
# I got hung up on the resizing and rehasing
#   
# techniques: 
# 1. prepopulate the array with a dummy node since its a fixed size (i.e. read the question)
# 2. use a linked list to handle collisions
# 3. if you know how to implement the add method the rest are the same with minor modificaitons
#           
class MyHashSet

    class ListNode
        attr_accessor :key, :nxt
        def initialize(key, nxt = nil)
            @key = key
            @nxt = nxt
        end
    end

    def initialize()
        @cap = 10**4        
        @store = Array.new(@cap) { ListNode.new(0) }
    end

    def add(key)
        idx = get_index(key)
        node = ListNode.new(key)
        head = @store[idx]

        while head.nxt
            return if head.nxt.key == key
            head = head.nxt
        end

        head.nxt = node
    end

    def remove(key)
        idx = get_index(key)
        head = @store[idx]

        while head.nxt
            if head.nxt.key == key
                head.nxt = head.nxt.nxt
                return
            end
            head = head.nxt
        end
    end

    def contains(key)
        idx = get_index(key)
        head = @store[idx]

        while head.nxt
            return true if head.nxt.key == key
            head = head.nxt
        end

        return false
    end

    private 

    def get_index(key)
        key % @store.length
    end

end

# Your MyHashSet object will be instantiated and called as such:
# obj = MyHashSet.new()
# obj.add(key)
# obj.remove(key)
# param_3 = obj.contains(key)