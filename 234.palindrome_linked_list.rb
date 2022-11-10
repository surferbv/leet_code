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
=begin

    stack approach

    time: O(n)
        We initially go through the whole list so n 
        the, we iterate through the list once more comparing
        what we saw on the stack that another n thus, 
        O(n) + O(n) = O(2n) = O(n)

    space: O(n)
        Since we are storing all the nodes we have seen in the list
        this will be n thus, O(n) space

    note:
        Another approach is the move all the nodes in the list into
        an array.

=end
def is_palindrome(head)
    stack   = []
    current = head

    # go through the list adding all the node values to the stack.
    while !current.nil?
        stack.push(current.val)
        current = current.next
    end

    # now we pop on the stack comparing each value
    # if one does not match it is not a palindrome return false else true
    current = head 
    while !stack.empty?
        node_val = stack.pop
        return false if node_val != current.val
        current = current.next
    end

    return true
end

=begin

    list manipulation approach

    time: O(n)
        To find the middle takes us O(n)
        To reverse it takes us O(n/2) = O(n)
        To check it O(n) 
        thus, O(n + n/2 + n) = ... = O(n)

    space: O(1)
        No additional memory allocated.
        
    note:
        Combines multiple techniques
        1. find the middle
        2. reverse the list
        3. traverse the list from both ends 
        
=end
def is_palindrome(head)
    fast = slow = head

    # find the middle i.e. slow will be at the middle
    while !fast.nil? && !fast.next.nil?
        fast = fast.next.next
        slow = slow.next
    end
    
    # reverse the second half of the list
    prev = nil
    while !slow.nil?
        tmp = slow.next
        slow.next = prev
        prev = slow
        slow = tmp
    end

    # now check values moving towards the middle
    left = head 
    right = prev # will be at the end after we reversed it
    while !right.nil?
        return false if left.val != right.val
        left = left.next
        right = right.next
    end

    return true
end
