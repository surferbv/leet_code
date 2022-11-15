#24.swap_nodes_in_pairs.rb
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
=begin

    two pointers approach

    time: O(n)

    space: O(1)

    note:
        tired need to redo this one. 

=end
def swap_pairs(head)
    dummy   = ListNode.new(-1, head)
    prev    = dummy
    curr    = head

    while curr && curr.next
                                        
        # save pointers                 [1, 2, 3, 4]
        nxt_ptr = curr.next.next        # nxt_ptr = 3
        second  = curr.next             # second = 2

        # reverse this pair
        second.next = curr              # second.next = 1
        curr.next   = nxt_ptr           # curr.next = 3
        prev.next   = second            # prev.next = 2

        # update pointers
        prev = curr                     # prev = 1
        curr = nxt_ptr                 # curr = 3
    end

    return dummy.next    
end