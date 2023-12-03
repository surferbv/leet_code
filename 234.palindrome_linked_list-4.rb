# 234. Palindrome Linked List
# Solved
# Easy
# Topics
# Companies
# Given the head of a singly linked list, return true if it is a 
# palindrome
#  or false otherwise.

 

# Example 1:


# Input: head = [1,2,2,1]
# Output: true
# Example 2:


# Input: head = [1,2]
# Output: false
 

# Constraints:

# The number of nodes in the list is in the range [1, 105].
# 0 <= Node.val <= 9
 

# Follow up: Could you do it in O(n) time and O(1) space?
#
# 234.palindrome_linked_list.rb
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
#
# notes:
# techniques:
# - two pointer appraoch
# - reverse linked list
# - pointer manipulations and other stuff you need to be good 
# - keep in mind that prev will be at the last node
def is_palindrome(head)
    slow, fast = head, head

    return head if head.nil?

    # move slow to mid point of the list 
    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    # now we reverse the half of the linked list
    prev = nil # prev will be at the last node
    while slow 
        temp = slow.next
        slow.next = prev
        prev = slow
        slow = temp
    end

    # now that we have reversed half of the linked list we can do
    # the left right pointer appraoch as we normally do with arrays
    left, right = head, prev # get confused at this point draw it out!
    while right
        return false if left.val != right.val
        left = left.next
        right = right.next
    end

    true
end