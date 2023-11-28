# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    
end

def print_linked_list(head)
    while head 
        print "#{head.val}->"
        print "nil" if head.next.nil?
        head = head.next
    end
    puts
end

def create_linked_list(array)
    dummy = ListNode.new()
    cur = dummy
    array.each do |n|
        node = ListNode.new(n)
        cur.next = node
        cur = cur.next
    end

    return dummy.next
end

