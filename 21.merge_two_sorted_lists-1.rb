# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {ListNode} list2
# @retur  n {ListNode}
class ListNode
    attr_accessor :val, :_next

    def initialize(val = -1000, _next = nil)
        @val = val
        @next = _next
    end
end

def merge_two_lists(list1, list2)
    dummy = ListNode.new()
    tail = dummy                                # this is like current node the move through the list

    while !list1.nil? && !list2.nil?
        if list1.val < list2.val
            tail.next = list1
            list1 = list1.next
        else
            tail.next = list2
            list2 = list2.next
        end
        tail = tail.next                        # did not move the tail forward!
    end

    if !list1.nil?
        tail.next = list1
    elsif !list2.nil?
        tail.next = list2
    end

   dummy.next 
end