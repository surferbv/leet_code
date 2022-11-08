# 160.intersection_of_two_linked_lists.rb
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
=begin
    
    hash table approach

    time: O(n + m) where n is the size of list A and m is the size of list B. 

    space: O(n) we may end up storing all the values of A in the hash. 

=end
require 'set'
def getIntersectionNode(headA, headB)
    seen = Set.new()

    cur_headA = headA
    cur_headB = headB

    while cur_headA 
        seen.add(cur_headA)
        cur_headA = cur_headA.next   
    end

    while cur_headB
        return cur_headB if seen.add?(cur_headB)
        cur_headB = cur_headB.next
    end

    return nil
end

=begin

    pointer offset and set approach

    algorithm

    1. keep incrementing l1 and l2 
    2. if l1 reaches the end set it to the head of l2 and visa versa
    3. when l1 == l2 then you know you have a cycle so return the node
    4. else you just return what the two pointers are pointing to which will be nil

    time: O(n + m) where n is the size of list A and m is the size of list B. 

    space: O(1)

=end
def getIntersectionNode(headA, headB)
    l1 = headA
    l2 = headB

    while l1 != l2
        if l1
            l1 = l1.next 
        else
            l1 = headB
        end

        if l2
            l2 = l2.next 
        else
            l2 = headA
        end
    end

    return l1    
end