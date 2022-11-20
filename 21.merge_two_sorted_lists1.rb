# 21.merge_two_sorted_lists1.rb
# https://leetcode.com/problems/merge-two-sorted-lists/
# https://youtu.be/XIdigk956u0
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
# @return {ListNode}
=begin

    iterative approach 

    time:

    space:
    
    note:
        DNC
=end
def merge_two_lists(list1, list2)
    new_list    = ListNode.new()
    tail        = new_list

    while list1 && list2
        if list1.val < list2.val
            tail.next = list1
            list1 = list1.next
        else
            tail.next = list2
            list2 = list2.next
        end
        tail = tail.next
    end

    if list1
        tail.next = list1
    elsif list2
        tail.next = list2
    end

    return new_list.next
end