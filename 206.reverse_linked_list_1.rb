# 206.reverse_linked_list_1.rb
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
#
# time: O(n)
# space: O(1)
# note: confused about the prev = nil and curr = head
def reverse_list(head)
    prev = nil
    curr = head

    while curr != nil
        tmp_node = curr.next
        curr.next = prev
        prev = curr
        curr = tmp_node
    end
    prev
end