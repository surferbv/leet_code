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
=begin

    recursive approach

    time: O(n) since we have to visit n nodes in the tree.

    space: O(n) it would be the height of the tree h since h is in n then n. 

=end
def invert_tree(root)
    return root if root.nil?

    tmp         = root.left
    root.left   = root.right
    root.right  = tmp

    invert_tree(root.left)
    invert_tree(root.right)
    
    return root
end

=begin

    iterative of bfs approach

    time: O(n) since we have to visit n nodes in the tree.

    space: O(n) it would be the height of the tree h since h is in n then n. 
   
=end
def invert_tree(root)
    queue = []

    return root if root.nil?

    queue.unshift(root) 
    
    while !queue.empty?
        current = queue.pop

        tmp             = current.left
        current.left    = current.right
        current.right   = tmp

        queue.unshift(current.left) if !current.left.nil?
        queue.unshift(current.right) if !current.right.nil?       
    end

    return root
end
