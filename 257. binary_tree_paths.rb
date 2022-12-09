# 257 binary tree paths (easy)
#
# TIL:
# I initially wrote this out and it was very complicated. 
# I think I go all tide up with where and how to insert the -> in the string. 
# Next time just forget about this and add the nodes then worry about the syntax. 
# Make sure you push the solution into the array instead off concatenating it. 
#
# https://leetcode.com/problems/binary-tree-paths/
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
# @return {String[]}
=begin

    dfs recursive approach

    time: O(n)
        We still need to visit each node this this is a linear operation. 

    space: O(n)
        In the worst case the tree is unbalanced and we have to a linear structure to add to the call stack. 
        In the best case the tree is balanced so we have log n call to the stack. 

    note:
        DFS with building path string. 

=end
def binary_tree_paths(root)
    @paths = [] 

    def build_paths(root, path)
        if root
            path += root.val.to_s # just add the value to the path
            
            if root.left.nil? && root.right.nil? # we're at a leaf node
                @paths.push(path)
            else
                path += '->' 
                build_paths(root.left, path)
                build_paths(root.right, path)
            end
        end
    end

   build_paths(root, "") 
   return @paths
end
