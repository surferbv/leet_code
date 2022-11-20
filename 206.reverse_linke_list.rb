# 206.reverse_linke_list.rb
# https://leetcode.com/problems/reverse-linked-list/
# https://youtu.be/G0_I-ZF0S38
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

    iterative approach

    time: O(n)

    space: O(1)

    note:
        Still did not complete

=end
def reverse_list(head)
    return head if head.nil?
    current     = head
    previous    = nil

    while current
        tmp = current.next
        current.next = previous
        previous = tmp
        previous = current
        current = tmp
    end


    return previous
end 


=begin

    iterative approach

    time: O(n)

    space: O(n)

    note:
        Know idea need to redo again. Clever way in creating new head and passing head.next

=end
def reverse_list(head)

    return head if head.nil?

    new_head = head
    if head.next 
        new_head = reverse_list(head.next)
        head.next.next = head
    end
    head.next = nil

    return new_head
end