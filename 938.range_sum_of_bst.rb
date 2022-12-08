# 938. Range Sum of BST (easy)
# trees
#
# TIL:
# I can't seem to understand the direction to travers down the tree 
# is the opposite of what I'm thinking.  
#
# https://leetcode.com/problems/range-sum-of-bst/
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
# @param {Integer} low
# @param {Integer} high
# @return {Integer}
=begin

    dfs approach 

    time: O(n)
        We have to visit every node in the tree. 

    space: O(n)
        Worst case the tree degrades to a list and we have to place one node on the call stack. 

    note:
        For each node see if it is within low and high. If so add it to the total if not you check to see which direction
        you should go based on the current nodes value. This is where I get it wrong as my brain keep thinking 
        backwards. If low is less than the value (i.e. node value is too high) move left. If the high is greator than value 
        (i.e. node value is too low) move right. You can also do this iterativly using a stack but doesn't save in any
        space or time. 
=end
def range_sum_bst(root, low, high)
    @total  = 0
    @low    = low
    @high   = high

    def dfs(node)
        if node
            @total += node.val if (@low..@high).include? node.val

            if @low < node.val
                dfs(node.left)
            end

            if node.val < @high
                dfs(node.right)
            end
        end
    end

    dfs(root)
    return @total
end
