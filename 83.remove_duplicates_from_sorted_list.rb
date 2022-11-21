# 83.remove_duplicates_from_sorted_list.rb
# https://leetcode.com/problems/remove-duplicates-from-sorted-list/
# https://www.youtube.com/watch?v=p10f-VpO4nE
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

    two while loop approach

    time: O(n)
        Even thought we have two loops in the worst case 
        suppose they were all duplicates then we run the loop n times
        and the outer while loop would stop since curre would be nil. 
        The same could be said if we had no duplicates.

    space: O(1)

    note:
        Try to draw this out thinking of using just checking current and current's next. 

=end

def delete_duplicates(head)
    curr = head

    while curr 
       while curr.next && curr.next.val == curr.val
        curr.next = curr.next.next
       end
       curr = curr.next
    end
    
    return head
end