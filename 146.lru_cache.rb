# approach: hash map + doubly linked list
# time: O(1) for both get and put
# space: O(capacity) for both get and put
# notes: 
#       Could not solve this in 45 minutes.
# techniques:
class Node
    attr_accessor :key, :val, :prev, :nxt
    def initialize(key, val, prev = nil, nxt = nil)
        @key    = key
        @val    = val
        @prev   = prev
        @nxt    = nxt
    end
end

class LRUCache

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @cache  = Hash.new(capacity)
        @CAP    = capacity 
        @size   = 0
        @l      = Node.new(0, 0) 
        @r      = Node.new(0, 0) 
        @l.nxt  = @r            # points to our LRU least
        @r.prev = @l            # points to our MRU most
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        if @cache.key?(key)
            # but we need to update the most recent
            node = @cache[key]
            remove(node)
            insert(node)
            return node.val
        else
            return -1
        end
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
        if @cache.key?(key)
            remove(@cache[key])
        end

        new_node = Node.new(key, value)
        @cache[key] = new_node 
        insert(new_node)

        if @cache.length > @CAP
            # remove from the list and del the LRU from the hashmap
            lru_node = @l.nxt
            remove(lru_node)
            @cache.delete(lru_node.key)
        end
    end

    private k

    # helper methods
    # remove node from the list
    def remove(mid_node)
        prev_node   = mid_node.prev
        nxt_node    = mid_node.nxt
        
        # before 
        # p -> mid_node <- n
        # after 
        # p -> <- n
        prev_node.nxt = nxt_node
        nxt_node.prev = prev_node
    end

    # insert node at right
    def insert(node)
        # before 
        # p -> <- r
        # 
        # after 
        # p -> <- n -> <- r
        prev_node       = @r.prev
        nxt_node        = @r
        prev_node.nxt   = node
        nxt_node.prev   = node
        node.prev       = prev_node
        node.nxt        = nxt_node 
    end

end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)