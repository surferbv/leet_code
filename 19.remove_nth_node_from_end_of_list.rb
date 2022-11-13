# 19.remove_nth_node_from_end_of_list.rb
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
#
=begin

=end
def remove_nth_from_end(head, n)

end

=begin

    two pass appraoch 

    time: O(n)
        Iterate once over the list n
        Then suppose the one we want to remove is the last n
        thus O(n + n) = O(2n) = O(n)

    space: O(1)

    note:
        could also reverse the linked list. 

=end
def remove_nth_from_end(head, n)
    curr    = head
    length  = 0

    # get the length
    while curr 
        curr = curr.next
        length += 1
    end

    # get the number of steps to remove from the end
    remove_at   = length - n
    prev        = head
    curr        = head
    
    # move prev and curr along until curr is at nth 
    remove_at.times do 
        prev = curr
        curr = curr.next
    end 

    # we remove the first item in the list
    if prev == curr
        head = curr.next 
        return head
    end

    # now remove curr
    prev.next = curr.next
    curr.next = nil

    return head    
end