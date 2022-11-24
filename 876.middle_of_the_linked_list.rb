# 876. Middle of the Linked List
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
=begin

    fast and slow pointer
    
    time: O(n)
        Because we have to iterate over the whole list

    space: O(1)
        No additional memory is used. 

    note:
        This uses a slow and fast pointer approach were fast moves twice as quick as slow.
=end
def middle_node(head)
    slow = fast = head

    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    return slow
end