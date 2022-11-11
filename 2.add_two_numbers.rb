# 2. Add Two Numbers
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
#
=begin

    iterative approach

    time: O(max(m,n))
        Where m is l1 and n is l2 which ever is larger. 

    space: O(max(m,n))
        Which ever is larger since we have to construct a new list
        and return it as the result. Could we do this in O(1)? 
        Tempted to write over the list which is larger and just add 
        more nodes to the end but hmmm...

    notes:
        Did not solve this on my own messed up on trying to get the 
        leftmost i.e. carry and rightmost value. 
        In ruby you should explicitly states when carry != 0 since 0 is not falsey
        Pretty clever trick is setting the values to 0 if the list is nil.
        You could see this by drawing it out. 

        Follow up what if the items in the linked list are stored in non reverse order?

=end
def add_two_numbers(l1, l2)
    result  = ListNode.new()
    curr    = result
    
    carry   = 0
    while l1 || l2 || carry != 0       
        v1 = 0
        v2 = 0 

        v1 = l1.val if l1
        v2 = l2.val if l2

        val         = v2 + v1 + carry
        carry       = val / 10              # leftmost our carry
        val         = val % 10              # rightmost val
        curr.next   = ListNode.new(val)     # why not curr ?
                
        curr = curr.next
        
        l1 = l1.next if l1 
        l2 = l2.next if l2 
    end

    return result.next
end
