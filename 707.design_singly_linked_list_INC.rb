# failing on 1 test case returns -1 when it it suppose to be nil
class MyLinkedList

    class ListNode
        attr_accessor :val, :next
        def initialize(val = -1, _next = nil)
            @val = val
            @next = _next
        end
    end

    def initialize()
        @head = ListNode.new(nil)
        @tail = ListNode.new(nil)
        @head.next = @tail
        @tail.next = nil 
        @size = 0
    end


=begin
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        return -1 if @size == 0 || index >= @size 

        curr = @head
        (index + 1).times do 
            curr = curr.next
        end
    
        return curr&.val
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        new_node = ListNode.new(val)

        if @size == 0 
            @head.next = new_node
            @tail.next = new_node
        else
            new_node.next = @head.next
            @head.next = new_node
        end
        @size += 1
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        if @size == 0 
            add_at_head(val)
        else
            new_node = ListNode.new(val)
            last_node = @tail.next
            last_node.next = new_node
            @tail.next = new_node
            @size += 1
        end
    end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
        return if index > @size

        new_node = ListNode.new(val)
        if index == @size
            add_at_tail(val)
        else
            curr = @head
            index.times do 
                curr = curr.next
            end
            new_node.next = curr.next
            curr.next = new_node
            @size += 1
        end
    end


=begin
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)
        # if the index is greater than the size return
        return if index >= @size

        # delete the node at the index
        prev = @head
        curr = @head.next

        # special case if the last node is being deleted we need to updat the tails next pointer
        if curr == @tail.next
            @tail.next = prev 
            return
        end

        index.times do
            prev = curr
            curr = curr.next
        end
        prev.next = curr&.next
    end
end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)