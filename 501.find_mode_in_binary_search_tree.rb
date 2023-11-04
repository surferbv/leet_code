# ##################################################################################################################
# Problem: Find Mode in Binary Search Tree
# Given the root of a binary search tree (BST) with duplicates, return all the mode(s) (i.e., the most frequently occurred element) in it.

# If the tree has more than one mode, return them in any order.

# Assume a BST is defined as follows:

# The left subtree of a node contains only nodes with keys less than or equal to the node's key.
# The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
# Both the left and right subtrees must also be binary search trees.
# ##################################################################################################################
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
# @return {Integer[]}
def find_mode(root)
    def dfs(root, counter)
        return if root.nil?

        counter[root.val] += 1
        dfs(root.left, counter)
        dfs(root.right, counter)
    end

    counter = Hash.new(0)
    dfs(root, counter)
    max_freq = counter.values.max

    ans = []
    counter.each do |k, v|
        ans << k if v == max_freq
    end

    ans
end
