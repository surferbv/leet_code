
# 88. merge sorted array
# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
#
# notes:
# the idea is that we start inserting or sorting items from the end of the list iterating all the way t
# to the begging of the list. As we do this we compare each element and which ever is greater we append it
# to the end of nums1 list. 
# Special case occurs when we have left over values in nums2. If this happens then we simply 
# add all the values of nums2 into nums1 since the remaining values will be the smallets. 
def merge(nums1, m, nums2, n)
    last = nums1.length - 1 # since nums.length = m + n 

    while m > 0 && n > 0
        if nums1[m - 1] > nums2[n - 1]
            nums1[last] = nums1[m - 1]
            m -= 1
        else
            nums1[last] = nums2[n - 1]
            n -= 1
        end
        last -= 1 # forgot to decrement last
    end

    while n > 0
        nums1[last] = nums2[n - 1]
        n -= 1
        last -= 1
    end

   nums1 
end

# 70. climbing staris
# @param {Integer} n
# @return {Integer}
#
# notes:
# DP problem hmmm that uses memization bottom up approach but I've still not understnind how to do this 
# need to look at the approach online. 
# Idea is to realize that the problem of the solution relise on the previous calculation
# For example if n = 5 we will start at the end assuming we are at 5. 
# so you ask yourself, self how many steps am I away from the solution... 1
# so from step 4 how many steps am I away from the solution... 1
# better to illustrate this... 
def climb_stairs(n)
    one, two = 1, 1 # starting from the back we know if you have n steps and you're at n there's only one solution.

    (n-1).times do 
        temp    = one
        one     = one + two
        two     = temp 
    end

    one # think abou this should we return two? it's laggin behind one so would it hold the end solution? 
end

# 206.reverse linked list
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
    cur = head

    return head if head.nil?

    while cur
        _next = cur.next
        cur.next = prev
        prev = cur
        cur = _next # struggeling here
    end

    prev
end

# 206.reverse linked list
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
# notes:
# neet way
def reverse_list(head)
    return head if head.nil? # you need to explicit return here because it's the base case

    reversed_sublist = head
    if !head.next.nil?
        reversed_sublist = reverse_list(head.next)
        head.next.next = head # need to trace this out what is going on here?
    end
    head.next = nil # why nil?

    reversed_sublist
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
# notes:
# leet way
def reverse_list(head)
    return head if head.nil? || head.next.nil?

    reverse_sublist = reverse_list(head.next)
    head.next.next = head
    head.next = nil

    reverse_sublist
end