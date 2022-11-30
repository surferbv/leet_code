# 98. Validate Binary Search Tree
# https://leetcode.com/problems/validate-binary-search-tree/
# https://www.youtube.com/watch?v=s6ATEkipzow
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
# @return {Boolean}
#
=begin

    DFS with boundaries approach

    time:O(n)
        Where n is the number of nodes in the tree.

    space: O(n)
        We have to make n call to the stack since we are using recursion. 

=end
def is_valid_bst(root)

    def valid(node, left, right)
        return true if node.nil?
        return false if !(node.val < right && node.val > left)

        return valid(node.left, left, node.val) && valid(node.right, node.val, right)
    end

    return valid(root, -Float::INFINITY, Float::INFINITY)
end


=begin
    What was wrong with this approach is that you need to account for everynode above it so you should pass a range down to it's children to compare
=end
def is_valid_bst(root)
   result = true
   if root

    return false if root.left && root.val < root.left.val 
    return false if root.right && root.val > root.right.val

    is_valid_bst(root.left) ? result : result = false
    is_valid_bst(root.right) ? result : result = false
   end 

   return result
end