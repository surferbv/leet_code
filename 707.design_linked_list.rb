# 707.design_linked_list.rb
# https://leetcode.com/problems/design-linked-list/
class MyLinkedList
    def initialize()
        @size = 0
        @head = ListNode.new(0)
        @tail = ListNode.new(0)
        @head.next = @tail
        @tail.prev = @head
    end

    class ListNode
        attr_accessor :val, :next, :prev
        def initialize(val = -1, _next = nil, _prev = nil)
            @val = val
            @next = _next
            @prev = _prev
        end
    end

=begin
    :type index: Integer
    :rtype: Integer
=end
    def get(index)
        if index + 1 < @size - index
            curr = @head
            (index + 1).times do
                curr = curr.next
            end
        else
            curr = @tail
            (@size - index).times do
                curr = curr.prev
            end
        end
        return curr.val
    end

=begin
    :type val: Integer
    :rtype: Void
=end
    def add_at_head(val)
        pred = @head
        succ = @head.next

        @size       += 1
        to_add      = ListNode.new(val)
        to_add.prev = succ
        pred.next   = to_add
        succ.prev   = to_add  
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def add_at_tail(val)
        pred = @tail
        succ = @tail.prev

        @size       += 1
        to_add      = ListNode.new(val)
        to_add.prev = succ
        pred.next   = to_add
        succ.prev   = to_add  
        
    end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add_at_index(index, val)
        
        if index > @size # out of bounds
            return
        end

        # if index is negative insert at the head
        index = 0 if index < 0

        if index < @size - index
            pred = @head

            index.times do
                pred = pred.next
            end
            succ = pred.next
        else
            succ = @tail
            
            (@size - index).times do
                succ = succ.prev
            end
            pred = succ.prev
        end

        # insertion 
        @size += 1
        to_add = ListNode.new(val)
        to_add.prev = pred
        to_add.next = succ
        pred.next = to_add
        succ.prev = to_add
    end


=begin
    :type index: Integer
    :rtype: Void
=end
    def delete_at_index(index)

        # invalid index
        return if index < 0 && index >= @size

        # find predecessor and successor of node to be deleted
        if index < @size - index
            pred = @head

            index.times do
                pred = pred.next
            end
            succ = pred.next.next
        else
            succ = @tail
            (@size - index - 1).times do
                succ = succ.prev
            end
            pred = succ.prev.prev
        end
        
        @size -= 1
        pred.next = succ
        succ.prev = pred
    end


end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)