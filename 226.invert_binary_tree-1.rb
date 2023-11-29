#226.invert_binary_tree.rb
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
# notes:
# almost try to think about a simple tree first and then add recusion. 
def invert_tree(root)
    return nil if root.nil?

    tmp = root.left 
    root.left = root.right
    root.right = tmp

    invert_tree(root.left)
    invert_tree(root.right)

    root
end