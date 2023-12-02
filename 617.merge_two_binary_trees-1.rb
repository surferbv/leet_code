# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}
#
# notes: 
# we do this recusively 
def merge_trees(root1, root2)
    # base case when both are nil
    return nil if root1.nil? && root2.nil? 

    root1 ? v1 = root1.val : v1 = 0
    root2 ? v2 = root2.val : v2 = 0

    root        = TreeNode.new(v1+v2)

    root1 ? root1_left = root1.left : root1_left = nil 
    root1 ? root1_right = root1.right : root1_right = nil 

    root2 ? root2_left = root2.left : root2_left = nil 
    root2 ? root2_right = root2.right : root2_right = nil 

    left        = merge_trees(root1_left, root2_left)
    right       = merge_trees(root1_right, root2_right) 

    root.left   = left
    root.right  = right
    
    root
end