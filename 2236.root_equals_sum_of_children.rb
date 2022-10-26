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
# ternary operator
# time: O(1) 
# space: O(1)
def check_tree(root)
    root.left.val + root.right.val == root.val ? true : false
end

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
# implicit boolean return 
# time: O(1)
# space: O(1)
def check_tree(root)
    root.val == root.left.val + root.right.val
end

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
# complement
# time: O(1)
# space: O(1)
def check_tree(root)
    root.left.val == root.val - root.right.val 
end

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
# conditional part 1
# time: O(1)
# space: O(1)
def check_tree(root)
    if root.val == root.left.val + root.right.val
        return true
    else
        return false
    end
end

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
# conditional part 2 
# time: O(1)
# space: O(1)
def check_tree(root)
    return true if root.val == root.left.val + root.right.val
    return false
end