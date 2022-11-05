# 101.symmetric_tree.rb
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
# recursive approach
#
# time: O(n) we still have to check all nodes values for symmetry
#
# space: O(H) the number of recursive calls is bounded by the height of the
#       tree thus H would be linear.
#
def is_symmetric(root)
    return is_mirror(root.left, root.right)
end

def is_mirror(left, right)
    return true if  left.nil? && right.nil?
    return false if left.nil? || right.nil?
        
    return left.val == right.val \
            && is_mirror(left.left, right.right) \
            && is_mirror(left.right, right.left)  
end

# iterative approach
#
# time: O(n) we would still have to iterate over all the nodes 
#       the structure would look like a triangle on with only left
#       and right children.
#
# space: O(n) the worst case we have to store as many nodes in the q that
#       are the same as the height of the tree.
#
def is_symmetric(root)
    queue = []
    queue.unshift(root)
    queue.unshift(root)

    while !queue.empty?
        left    = queue.pop()
        right   = queue.pop()

        next if left.nil? && right.nil? 
        return false if left.nil? || right.nil?
        return false if left.val != right.val
        queue.unshift(left.left)
        queue.unshift(right.right)
        queue.unshift(left.right)
        queue.unshift(right.left)
    end

    return true
end