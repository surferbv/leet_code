=begin
        
    144. Binary Tree Preorder Traversal (easy)

    approach:
        recursive approach

    links:
        https://leetcode.com/problems/binary-tree-preorder-traversal/

    time: O(n)

    space: O(log n)
        Assuming it's a balanced tree

    note:
        root->left->right could also pass an array as an argument. 

    til:
        root->left->right is preorder. Order matters. 

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
def preorder_traversal(root)
    @result = []

    def preorder(root)
        if root
            @result << root.val
            preorder(root.left)
            preorder(root.right)
        end
    end

    preorder(root)
    return @result
end