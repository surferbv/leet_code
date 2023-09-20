#  21.merge_two_sorted_lists.rb
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
#
# iterative approach
# time: O(m + n) where m is the length of list1 and n is the length of list2
# space: O(1) we are not adding any functions onto the call stack
# note: could not figure this out some points to consider:
#   1. dummy = ListNode.new(-1) and tail = dummy
#   2. while list1 != nil && list2 != nil
#   3. we need to return dummy.next
#   4. if the list still has nodes left over we need to add them to the tail
#   5. tail = tail.next
#   6. tail.next = list1 if list1 != nil
#   7. tail.next = list2 if list2 != nil
#   8. dummy.next
def merge_two_lists(list1, list2)
    dummy = ListNode.new(-1)
    tail = dummy
    
    while list1 != nil && list2 != nil
        if list1.val < list2.val
            tail.next = list1
            list1 = list1.next
        else
            tail.next = list2
            list2 = list2.next
        end
        tail = tail.next
    end

    if list1 != nil
        tail.next = list1
    else
        tail.next = list2
    end

    dummy.next
end
