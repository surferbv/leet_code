=begin
    203. remove linked list elements 

    links:
        https://leetcode.com/problems/remove-linked-list-elements/
    
    approach:
        dummy node approach

    time: O(n)
        Since we still need to iterate over all nodes in the list to find the 
        val we want to remove.

    space: O(1)
        We do not allocate any additional space.

    note:   
        Draw this out it really doesn't require a tmp variable
        just do prev.next = curr.next

    til:
        Don't need tmp and dummy node

    result:
        Runtime 103 ms Beats 92.86% Memory 213 MB Beats 39.29%
=end
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
    dummy       = ListNode.new(0, head)
    dummy.next  = head
    prev,curr   = dummy, head

    while curr
        if curr.val == val
            prev.next = curr.next 
        else
            prev = curr
        end
        curr = curr.next        
    end 

    return dummy.next
end