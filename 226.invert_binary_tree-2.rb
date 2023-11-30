# 226.invert_binary_tree.rb
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
# @return {TreeNode}
#
# note: draw it out with just the simple case 
# 
def invert_tree(root)

    # base case if root is nil
    return root if root.nil?


    # swap the values
    temp = root.left
    root.left = root.right
    root.right = temp

    # simple case might not even need this condition as the trees 
    # appear to be balanced might want to clarify this  
    # now we recuse? 
    # recusive case is at the bottom but why? 
    # and we don't even need to check if roo.left or root.right are nil
    # and we don't need to store the result :hmmmm:
    invert_tree(root.left) if root.left
    invert_tree(root.right) if root.right
    
   root 
end