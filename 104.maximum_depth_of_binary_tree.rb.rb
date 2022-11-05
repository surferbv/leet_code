# 104.maximum_depth_of_binary_tree.rb
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
# @return {Integer}
#
# recursive approach
#
# time: O(n) could be a linked list of nodes
#
# space: O(n) 
def max_depth(root)
    return 0 if root.nil? 
    return 1 + [max_depth(root.left), max_depth(root.right)].max
end

# BFS iterative approach
#
# time: O(n)
#
# space: O(n) 
def max_depth(root)
    level = 0
    queue = []
    queue.unshift(root)

    return 0 if root.nil? 
    
    while !queue.empty?
        
        for i in (0..queue.length - 1) do
            node = queue.pop()
            if !node.nil?
                queue.unshift(node.left) if node.left
                queue.unshift(node.right) if node.right
            end
        end
       
        level +=1
    end
   
    return level
end