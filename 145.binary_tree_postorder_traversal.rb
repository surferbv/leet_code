=begin

    145. Binary Tree Postorder Traversal

    links:
        https://leetcode.com/problems/binary-tree-postorder-traversal/

    approach:
        postorder traversal approach

    time: O(n)
        For a skewed tree it would degrade to a linked list. 

    space: O(h)
        Where h is the height of the tree. 

    note:
        postorder traversal left->right->root

    til:
        Try printing it out first if you're stuck. 
    
=end
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
def postorder_traversal(root)
    @path = []

    def postorder(root)
        if root
            postorder(root.left)
            postorder(root.right)
            @path << root.val
        end
    end

    postorder(root)
    return @path
end