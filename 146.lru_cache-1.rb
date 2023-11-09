# 146. LRU Cache    
# approach: hash map
# time: O(1) for both get and put
# space: O(capacity) for both get and put
# notes: could not solve this in 45 minutes but came close
#        messed up on the size of the cache check when putting a new key
# techniques: 
#           1. use a hash map
#           2. LRU will be the first element on the left and the MRU will be the last element on the right    
#           3. When we get a key, we need to update the most recent this is done by deleting the key and reinserting it
#           4. Don't forget to update the size of the cache when you put
class LRUCache

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
        @CAP = capacity
        @cache = Hash.new()
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
        # first check if the key exists
            # if it does, then we need to update the most recent
            # get key and updates it as the last accessed 
        # else it doesn't exists, then we return -1

        if @cache.key?(key)
            value = @cache.delete(key)
            @cache[key] = value
            return value
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
        # first check if the key exists
        #   if it does, then we update the key and it's most recently used 
        # else, we check the size
        #   if the size exceeds capacity evict the LRU
        #   add it to the cache
        
        if @cache.key?(key)
            @cache.delete(key)
            @cache[key] = value
        else
            if @cache.size + 1 > @CAP
                @cache.delete(@cache.first[0]) # evict lru assuming its the first element on the left
            end
            @cache[key] = value
        end
    end
end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
