# doubly_linked_list.rb

class MyLinkedList
    attr_accessor :head, :tail

    class ListNode
        attr_accessor :val, :next, :prev 

        def initialize(_val = -1, _next = nil, _prev = nil)
            @val = _val
            @next = _next
            @prev = _prev
        end
    end

    def initialize()
        # dummy nodes
        @left = ListNode.new(0)
        @right = ListNode.new(0)

        # they just point at each other
        # we do this because everything is being inserted inside the middle of the linked list
        @left.next = @right
        @right.prev = @left
    end


=begin
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        cur = @left.next
        while cur && index > 0
            cur = cur.next
            index -= 1
        end

        # we can't be out of bounds and our index don't really understand this part
        if cur && cur != @right && index == 0
            return cur.val
        end
        return -1
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        node = ListNode.new(val)
        nxt = @left.next
        prev = @left 

        # should draw this up not sure
        prev.next = node
        nxt.prev = node
        node.next = nxt 
        node.prev = prev 
    end

=begin
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        node = ListNode.new(val)
        nxt = @right
        prev = @right.prev

        # should draw this up not sure
        prev.next = node
        nxt.prev = node
        node.next = nxt 
        node.prev = prev 
    end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
        cur = @left.next
        while cur && index > 0
            cur = cur.next
            index -= 1
        end
        if cur && index == 0
            node = ListNode.new(val)
            nxt = cur 
            prev = cur.prev
    
            # should draw this up not sure
            prev.next = node
            nxt.prev = node
            node.next = nxt 
            node.prev = prev 
        end
    end


=begin
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
        cur = @left.next
        while cur && index > 0
            cur = cur.next
            index -= 1
        end
        if cur && cur != @right && index == 0
            nxt = cur.next
            prev = cur.prev
    
            # should draw this up not sure
            nxt.prev = prev
            prev.next = nxt
        end
    end
end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)
