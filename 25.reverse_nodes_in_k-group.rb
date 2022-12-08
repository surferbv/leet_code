# 25 reverse nodes in k-group (hard) (top 100 liked)
#
# TIL:
# I was creating a dummy node by setting the val = head doh!! 
#
# https://leetcode.com/problems/reverse-nodes-in-k-group/
# https://www.youtube.com/watch?v=1UOPsfP85V4
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
=begin

    iterative approach

    time: O(n)
        As we still need to iterate through the whole list to reverse k-groups 

    space: O(1)
        No additional memory is allocated besides basic linking operations to 
        reverse nodes in the list.

    note:
        Tricky pointer work try to draw this out in groups of k and get the kth. 
        Try doing this again using a more rubbish approach. 

=end
def reverse_k_group(head, k)
    dummy = ListNode.new(0, head)
    group_prev = dummy # we need one node right before our group
    
    while true
        kth = get_kth(group_prev, k)

        break if !kth

        group_next = kth.next

        prev, curr = kth.next, group_prev.next # if you use nil it will break the list so we use kth.next

        while curr != group_next # we now reveres the group portion of the list
            tmp = curr.next
            curr.next = prev
            prev = curr
            curr = tmp
        end

        # tricky part I don't even understand
        tmp = group_prev.next # this will be the first node in our group
        group_prev.next = kth
        group_prev = tmp
    end
    
    return dummy.next
end

# we move curr k spots ahead
def get_kth(curr, k)
    while curr && k > 0
        curr = curr.next
        k -= 1
    end
    return curr
end
