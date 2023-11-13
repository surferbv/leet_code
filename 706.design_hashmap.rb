# approach: array and linked list
#
# time: O(1) more as an average case 
#
# space: O(n) where n is the number of unique keys
#
# notes: Forgot to consider that I should be using cur.nxt.key 
#   instread of cur.key when checking for the key
#
# techniques: Similar to the hash set
# 1. prepopulate the array with a dummy node since its a fixed size using a key and value
# 2. use a linked list to handle collisions
# 3. if you know how to implement the put method the rest are the same with minor modificaitons
# 
class MyHashMap
    class ListNode 
        attr_accessor :key, :value, :nxt

        def initialize(key, value, nxt = nil)
            @key = key
            @value = value
            @nxt = nxt
        end
    end

    def initialize()
        @store = Array.new(10**4) { ListNode.new(-1, -1) } 
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        index = get_index(key)
        cur = @store[index]
        while cur.nxt
            if cur.nxt.key == key
                cur.nxt.value = value
                return
            end
            cur = cur.nxt
        end
        
        cur.nxt = ListNode.new(key, value)
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        index = get_index(key)
        cur = @store[index]
        while cur.nxt
            return cur.nxt.value if cur.nxt.key == key
            cur = cur.nxt
        end

        -1 
    end


=begin
    :type key: Integer
    :rtype: Void
=end
    def remove(key)
        index = get_index(key)
        cur = @store[index]
        while cur.nxt
           if cur.nxt.key == key
            cur.nxt = cur.nxt.nxt 
            return
           end
           cur = cur.nxt
        end
    end

    private 

    def get_index(key)
        key % @store.length
    end

end

# Your MyHashMap object will be instantiated and called as such:
# obj = MyHashMap.new()
# obj.put(key, value)
# param_2 = obj.get(key)
# obj.remove(key)