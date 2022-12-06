# 653.two_sum_iv_input_is_BST (easy) (freq: med)
# https://leetcode.com/problems/two-sum-iv-input-is-a-bst/description/
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
# @param {Integer} k
# @return {Boolean}
=begin

    bfs and hash set approach

    time: O(n)

    space: O(n)

    note:
        Use a hash set by using BFS on the tree since it is a BST. 
        
=end
require 'set'
def find_target(root, k)
    q   = []
    set = Set.new()
    
    q.unshift(root)

    while !q.empty?

        if !q.last.nil?
            node = q.pop
            return true if set.include?(k - node.val) 
            set.add(node.val)
            q.unshift(node.right)
            q.unshift(node.left)
        else
            q.pop
        end
    end

    return false    
endERE