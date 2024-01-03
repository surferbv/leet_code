# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end
#
# approach: 
#   two pointer approach (i.e. fast slow Floyd's Tortoise and Hare)
# time: 
#   O(n) we must iterate through the linked list
# space: 
#   O(1) no additional memory needed. Yay!
# 
# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  slow, fast = head, head

  while fast && fast.next
    fast = fast.next.next
    return true if slow == fast 
    slow = slow.next
  end

  false
end