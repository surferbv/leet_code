=begin

    title:
        285. Inorder Successor in BST

    links:
        https://leetcode.com/problems/inorder-successor-in-bst/

    approach:

    time:

    space:

    note:
        INCOMPLETE

    til:

    results:

=end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end
# @param {TreeNode} root
# @param {TreeNode} p
# @return {TreeNode}
def inorder_successor(root, p)
    @p = p

    def inorder(node)
        if node
            inorder(node.left)
            print node.val if node.val == @p.val
            inorder(node.right)
        end
    end

    inorder(root)
end