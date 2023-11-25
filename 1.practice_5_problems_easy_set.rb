# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    houses = nums
    house1, house2 = 0, 0

    # recurence relation 
    # [house1, house2, house, house - 1, house - 2, ...]
    # rob = [house[0] + rob(house[2:n]), rob(house[1:n])].max either we rob the first house and 
    # the houses from 2:n or we rob house 1:n skipping the first house
    houses.each do |house|
        tmp = [house + house1, house2].max
        house1 = house2 # keeping track of the last max robbed house
        house2 = tmp    # so in the end we will have the max house total here 
    end

    house2
end

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
# notes:
# here we should create a dummy node
# this helps handeling some of the edge cases mainly the case when we have an empty list
# then from there we create a tail and insert the nodes of l1 and l2 from the tail
# when we reach the end we want to make sure that if any list is not nil that we appened the 
# remainder of the nodes to the non-empty 
def merge_two_lists(list1, list2)
    l1, l2 = list1, list2       # for brevity 
    dummy = ListNode.new(-1000) # value that is not within the val constraints 
    tail = dummy                # where we do our inserting 

    while !l1.nil? && !l2.nil?  
        if l1.val < l2.val
            tail.next = l1
            l1 = l1.next
        else
            tail.next = l2
            l2 = l2.next
        end
        tail = tail.next
    end

    # at this point we need to check if there are any left over nodes and 
    # for those that are left over in the list we need to add them to the output list
    if !l1.nil?
        tail.next = l1
    elsif !l2.nil?
        tail.next = l2
    end

    dummy.next
end

# @param {Integer[]} prices
# @return {Integer}
#
# notes:
# this is a two pointer appraoch
# first conceptrually we need to keep track of the profit. A posative profit is only possible when l we call is sell is > r we call this they buy
# so we should only calc profit that is posative and keep track of it.
# second we would only move the right pointer forward whil moving the left pointer only when we find a better profit ( hmm this is a little unclear)
# we keep doing this until we reach the end of the array move r one step and l jumping to r when the prev condition is met
def max_profit(prices)
    l  = 0 # sell 
    max_profit = 0

    (1..prices.length - 1).each do |r| # r is buy
        if prices[l] < prices[r]
            profit = prices[r] - prices[l]
            max_profit = [max_profit, profit].max
        else
            l = r
        end
    end

    max_profit
end


# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
#
# notes:
# In this case we use two pointers m and n however we keep track of the last point where we can insert at the end of nums1
# So we compare each last element in each array moving long and adding that to the end. 
# we keep doing this till we reach the end of one of the arrays. 
# but we need to account of the case where nums2 has a smaller element. If that is the case we need to check at the end if there 
# are any elements left over and if so add them to nums1 and return nums1
# 
# Gotchas:
# not account for m and n offset by one
# using the wrong equality symbol for while loop
# not understadning the last condition if you have left over values in nums2
def merge(nums1, m, nums2, n)
    last = (m + n) - 1

    while m > 0 && n > 0
        if nums1[m - 1] > nums2[n - 1]
            nums1[last] = nums1[m - 1]
            m -= 1
        else
            nums1[last] = nums2[n - 1]
            n -= 1
        end
        last -= 1
    end

    while n > 0                         # also forgot how to add nums back to the end of nums1 from nums2 this step 
        nums1[last] = nums2[n - 1]
        n -= 1
        last -= 1
    end
    
    nums1
end



# @param {Integer} n
# @return {Integer}
#
# notes:
# DP problem hmmm that uses memiization bottom up approach but I've still not understnind how to do this 
# need to look at the approach online. 
def climb_stairs(n)
    
end