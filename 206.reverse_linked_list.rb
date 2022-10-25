#206. Reverse Linked List

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
# iterative appraoch
# time: O(n) you have to go through all n nodes in the list
# space: O(1) no additional data structures or calls to the stack are made
def reverse_list(head)
    previous = nil
    current = head
    while current
        tmp_current_next = current.next
        current.next = previous
        previous = current
        current = tmp_current_next
    end
    return previous
end


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
# recursive appraoch
# time: O(n) 
# space: O(n) 
def reverse_list(head)
    
    return head if head.nil?

    previous    = nil

    current     = head

    tmp_current_next = current.next

    previous = current

    current 

    node = reverse_list(head.next)
    
end