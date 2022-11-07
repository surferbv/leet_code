# 141.linked_list_cycle.rb
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
#
=begin
    hash table approach

    time: O(n) we must iterate through the linked list 
        at most n times to find the cycle if it is the last node.

    space: O(n) worst case we have to store all the nodes in the linked 
        list in the hash table. 
=end
def hasCycle(head)
    seen = {}
    current = head

    return false if head.nil? || head.next.nil?
    
    while !current.nil?
        if seen.key?(current)
            return true
        else
            seen[current] = current.val
        end
        current = current.next
    end
    
    return false
end

=begin
    two pointer approach (i.e. fast slow Floyd's Tortoise and Hare)

    time: O(n) we must iterate through the linked list 
        at most n times to find the cycle if it is the last node.

    space: O(1) no additional memory needed. Yay!
=end
def hasCycle(head)
    fast = slow = head
    
    while fast && fast.next
        slow = slow.next
        fast = fast.next.next

        return true if slow == fast
    end

    return false
end
