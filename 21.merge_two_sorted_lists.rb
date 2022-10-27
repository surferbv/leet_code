# 21. Merge Two Sorted Lists

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
#
# recursive approach
# time: O(m + n) where m + n is the number of stacks calls for the recursive call
# space: O(m + n) where m is the length of list1 and m is the length of list2
def merge_two_lists(list1, list2)
    head  = ListNode.new()

    # base case 
    return list2 if list1 == nil
    
    return list1 if list2 == nil

    # recrusive case
    if list1.val < list2.val 
        head = list1
        head.next = merge_two_lists(list1.next, list2)
    else
        head = list2
        head.next = merge_two_lists(list1, list2.next)
    end
        
    return head
end

# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
#
# iterative approach
# time: O(m + n) where m + n is the number of stacks calls for the recursive call
# space: O(1) since were are not adding adding functions onto the call stack
def merge_two_lists(list1, list2)
    head  = tail = ListNode.new(-1)

    while list1 && list2 
        if list1.val < list2.val
            tail.next = list1
            list1 = list1.next
        else
            tail.next = list2
            list2 = list2.next
        end
        tail = tail.next
    end

    tail.next = list2 if  list1 == nil && list2 != nil

    tail.next = list1 if list2 == nil && list1 != nil
        
    return head.next
end

##################################################################################
# teaching section

# time: O(n + m) list1 n in length and list2 is m in length so 
# space: O(n + m) list1 would make at most n call to the stack and list2 would make at most m call to the stack. O(n + m)
# recursive 
def merge_two_lists(list1, list2)
    head = ListNode.new()

    return list2 if list1 == nil && list2 != nil 

    return list1 if list1 != nil && list2 == nil 

    return head.val = nil if list1 == nil && list2 == nil

    if list1.val < list2.val
        head = list1
        head.next = merge_two_lists(list1.next, list2)
    else
        head = list2
        head.next = merge_two_lists(list1, list2.next)
    end

    return head
end


# iterative appraoch 
def merge_two_lists(list1, list2)
    tail = head = ListNode.new()

    while list1 && list2
        if list1.val < list2.val
            tail.next  = list1
            list1 = list1.next
        else
            tail.next  = list2
            list2 = list2.next
        end
        tail = tail.next
    end

    tail.next = list2 if list1 == nil && list2 != nil 

    tail.next = list1 if list1 != nil && list2 == nil 

    return head.next
end
























































































