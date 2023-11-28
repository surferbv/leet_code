# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    fast = head
    slow = head

    # we move fast twice as fast as slow which ensures that slow lands in the mid of the list
    while fast && fast.next # while fast is not nill and what fast is pointing to is not nil
        fast = fast.next.next
        slow = slow.next
    end

    # now we need to reverse the linked list from the point of where slow left off
    prev = nil # forgot this part!!!!
    while slow
        temp = slow.next
        slow.next = prev
        prev = slow
        slow =temp 
    end

    # now we compare the values of slow and fast
    left, right = head, prev # why is right prev? 
    while right # why fast instead of slow? 
        return false if left.val != right.val
        right = right.next
        left = left.next
    end

   true 
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

