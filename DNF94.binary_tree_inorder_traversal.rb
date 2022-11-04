# 94.binary_tree_inorder_traversal.rb
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
#
#
# recursive approach
#
# time: O(n) because the recursive function is T(n) = 2 * T(n/2) + 1
#
# space: O(n) where n is the number of nodes we have to traversed
#
def inorder_traversal(root)
    result = []

    helper(root, result)

    return result
end

def helper(root, result)
    if !root.nil?
        helper(root.left, result)

        result.push(root.val)

        helper(root.right, result)
    end
end

# iterative approach
#
# time: O(n) but we have two loop?
#
# space: O(n) 
#
def inorder_traversal(root)
    result  = []
    stack   = []
    current = root

    while current || !stack.empty?
        while current
            stack.push(current)
            current = current.left
        end
        current = stack.pop
        result.push(current.val)
        current = current.right
    end
    
    return result
end