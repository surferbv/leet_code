#206. Reverse Linked List

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
# iterative appraoch
#
=begin

    iterative appraoch 

    time: O(n) we iterate throught the list once so it's the number of nodes n. 

    space: O(1) we don't store anything in memory besides some temporary operators.

=end
def reverse_list(head)

    previous = nil
    current = head
    
    while current
        tmp = current.next
        current.next = previous
        previous = current
        current = tmp
    end

    return previous
end

=begin

    recursive appraoch 

    time: O(n) we iterate throught the list once so it's the number of nodes n. 

    space: O(n) b/c we have to save each recursive call on the call stack. 

=end
def reverse_list(head)
    
    return head if head.nil?

    new_head = head
    
    if head.next
        new_head = reverse_list(head.next) 
        head.next.next = head # reverse the link 
    end

    head.next = nil

    return new_head
end
