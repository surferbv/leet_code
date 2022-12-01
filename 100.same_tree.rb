# 100. Same Tree
# https://leetcode.com/problems/same-tree/
# https://www.youtube.com/watch?v=vRbbcKXCxOw
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
#
=begin

    DFS approach

    time: O(p + q)
        If both trees were the same structurally have have the same values they have to go through all the nodes in the tree.

    space: O(n)
        Since each would add about n function calls to the stack. 

    note:
        DFS and checking for false conditions. 

=end
def is_same_tree(p, q)
    return true if p.nil? && q.nil?
    
    return false if (p.nil? || q.nil?) || (p.val != q.val)
    
    return is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end