# 111 minimum depth of a binary tree (easy)
#
# TIL:
# You can change the structure of the node you're passing into the queue
# to keep track of the depth. Whoa! 
#
# https://leetcode.com/problems/minimum-depth-of-binary-tree/
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
=begin

    bfs approach

    time: O(n)
        In the worst case we have a balanced tree
        so we'd still have to visit all n/2 nodes. 

    space: O(n)
            
    note:
        BFS or DFS initially solved this using BFS with a DFS twist didn't work :( 
        Clever trick in passing the depth down the the child by using an array.
        A tuple could have been used as well but they don't exists in ruby. 

=end
def min_depth(root)
    q = []
    
    if root.nil?
        return 0 
    else
        q.prepend( [ 1, root ] )

        while !q.empty?
            tmp_node    = q.pop
            depth       = tmp_node[ 0 ]
            curr_root   = tmp_node[ 1 ]
            children    = [ curr_root.left, curr_root.right ]

            if !children.any?
                return depth
            end

            children.each do |child|
                q.prepend( [ depth + 1, child ] ) if child
            end
        end
    end
end