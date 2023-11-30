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
# yeah right confused a little by the logic but 
# essentially it's pretty simple if you read through it
# what you're trying to do is merge the two values 
# the tricky part is accounting for the edge cases where
# there's no node or a nil node 
#
def merge_trees(root1, root2)
    # base case if both root1 and root2 are nil
    return nil if root1.nil? && root2.nil?

    # merging values of roots
    root1 ? v1 = root1.val : v1 = 0 
    root2 ? v2 = root2.val : v2 = 0

    # merging or creating a new node from those values
    root = TreeNode.new(v1+v2)

    # get the left and rights of root1
    root1 ? root1_left = root1.left : root1_left = nil
    root1 ? root1_right = root1.right : root1_right = nil


    # get the left and rights of root2
    root2 ? root2_left = root2.left : root2_left = nil
    root2 ? root2_right = root2.right : root2_right = nil

    root.left = merge_trees(root1_left, root2_left) 
    root.right = merge_trees(root1_right, root2_right) 

    root
end