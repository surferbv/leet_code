# 234.palindrom_linked_list.rb
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    fast, slow = head, head

    # moving slow to mid position
    while fast && fast.next # don't forget to check fast.next nil! 
        slow = slow.next
        fast = fast.next.next
    end

    # reversing half of the list
    prev = nil
    while slow 
        tmp = slow.next
        slow.next = prev
        prev = slow
        slow = tmp
    end

    # checking the values as we normally would in an array
    left, right = head, prev # WRONG! slow because this is where slow was last left at mid. Turns out it should be prev why? b/c prev = slow? :think: 
    while right 
        return false if left.val != right.val
        left = left.next
        right = right.next
    end

   true 
end