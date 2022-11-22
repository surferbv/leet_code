# 1290.convert_binary_number_in_a_linked_list_to_integer.rb
# https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer}
=begin
    
    power of two's approach 

    time: O(n)

    space: O(1)

    note: 
        Should redo didn't think about using num * 2 and used an artificial index. 

=end
def get_decimal_value(head)
    num = head.val

    while head.next
        num = num * 2 + head.next.val
        head = head.next
    end
    
    return num
end