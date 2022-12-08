# 23. merge k sorted lists (hard)
# 
# TIL:
# You can use merge sort on a linked list. WOW! Thanks NEET CODE!
#
# https://leetcode.com/problems/merge-k-sorted-lists/
# https://www.youtube.com/watch?v=q5a5OiGbT6Q
# 
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
#
=begin

    merging two lists

    time: O(n log k)
        N is the depth of the each merge and k is the number of times we iterate over each list.

    space: O(n)
        
    note:
        If you can solve merge_lists you can sort of solve this one since it requires you to merge two lists. 
    
=end
def merge_k_lists(lists)
    return nil if lists.nil? || lists.length == 0

    while lists.length > 1
        merged_lists = []

        (0..lists.length - 1).step(2) do |i|
            l1 = lists[i]
            if (i + 1) < lists.length
                l2 = lists[i + 1] 
            else
                l2 = nil
            end 
            merged_lists << (merge_list(l1, l2))
        end
        lists = merged_lists
    end

    return lists[0]
end

def merge_list(list1, list2)
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