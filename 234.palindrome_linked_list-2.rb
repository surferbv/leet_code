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
#
# notes:
# So tricky got the first chunk the second chunk as well that is reversing the linked list
# but don't need to use a cur pointer just use slow
# last part or third not sure why they can say left = head
# 
def is_palindrome(head)
    # two pointers one is fast the other is slow
    # we move the slow pointer one step and the fast pointer two steps
    # once the fast reaches the end the slow pointer will be in the middle 
    # at this point I start to get confused 
    # but essentialy we now use the slow pointer or mid to reverse the list 
    # from the halfway point remembering to keep the ref to the prev? 
    # ah shit let's just code it and see how far we get... 

    slow, fast = head, head

    while fast && fast.next
        slow = slow.next
        fast = fast.next.next
    end

    # slow should be at mid so we set a new pointer calling it prev for 
    # the previous pointer of the new list we are going to rever
    # we are reversing the list at this point
    prev = nil
    # cur = head # this is not needed we can just use the slow pointer? 
    # while cur != slow
    #     temp = cur.next
    #     cur.next = prev
    #     prev = cur
    #     cur = temp
    # end
    while slow
        temp = slow.next
        slow.next = prev
        prev = slow
        slow = temp
    end


    #  use the left and right techniqu like we do with arrays 
    left, right = head, prev  # but why would we use left = head? isn't head pointing at the last element in the reversed list? 
    while right 
        return false if left.val != right.val 
        right = right.next
        left = left.next
    end

    true
end