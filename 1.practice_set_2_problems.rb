# 70. Climbing Stairs
# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    one, two = 1, 1

    (n - 1).times do
        one_prev = one
        one = one + two
        two = one_prev
    end

   one 
end

# 206. Reverse Linked List
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

    while cur
        _next = cur.next
        cur.next = prev
        prev = cur
        cur = _next
    end

    prev
end

# 206. Reverse Linked List
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)

    return head if head.nil? || head.next.nil?

    sublist = reverse_list(head.next)
    head.next.next = head
    head.next = nil # this should be head not sublist

    sublist
end

# 543. Diameter of Binary Tree
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
    
end