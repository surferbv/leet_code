# 206. reverse linked list
# 
# attempt: 3
#
# approach: iterative 
#
# time: O(n)
#
# space: O(1)
#
# notes:
#      This is a iterative solution that is a little easier to understand
#      but it's still confusing to understand the two pointer approach.
#      Try drawing this out to understand it better.
#
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
def reverse_list(head)
    prev = nil 
    cur  = head

    while cur 
        tmp = cur.next 
        cur.next = prev
        prev = cur 
        cur = tmp
    end
    prev
end


# 206. reverse linked list
# 
# attempt: 3
#
# approach: recursive 
#
# time: O(n)
#
# space: O(n)
#
# notes:
#       This is a recursive solution this is a bit more confusing to understand
#       especially the line: head.next.next = head
#
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
def reverse_list(head)
    # base case
    return head if head.nil?

    # recursive case
    new_head = head
    if head.next
        new_head = reverse_list(head.next)
        head.next.next = head # do not understand this line
    end
    head.next = nil

    new_head
end

# 206. reverse linked list
# 
# attempt: 3
#
# approach: recursive 
#
# time: O(n)
#
# space: O(n)
#
# notes:
#       This is a recursive solution that is a little easier to understand
#       it uses a helper function to do the recursion (i.e. reverse(cur, prev))
#
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
def reverse_list(head)
    def reverse(cur, prev)
        if cur.nil?
            return prev
        else
            _next = cur.next
            cur.next = prev
            return reverse(_next, cur)
        end
    end

    return reverse(head, nil)
end