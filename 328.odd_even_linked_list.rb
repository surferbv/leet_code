# 328. odd even linked list
# https://leetcode.com/problems/odd-even-linked-list/description/
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

    Even list and odd list approach 

    time: O(n)

    space: O(1)
        We don't create a new list we use the existing nodes to re-link the odd and evens. 

    note:
        Put the odd nodes in a linked list and the even nodes in another. Then link the evenList to the tail of the oddList.
        Nice way to think about this to move even to even list and odds to odd list. 

=end
def odd_even_list(head)
    return head if head.nil?

    odd         = head
    even        = head.next
    even_head   = head.next
    
    while even != nil && even.next != nil
        odd.next    = odd.next.next
        even.next   = even.next.next

        odd         = odd.next
        even        = even.next
    end
    odd.next = even_head
    
    return head
end