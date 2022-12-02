# 110.balanced_binary_tree.rb
# https://leetcode.com/problems/balanced-binary-tree/
# https://www.youtube.com/watch?v=QfJsau0ItOY
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
=begin

    dfs appraoch

    time: O(n)

    space: O(n)

    note:
        DFS start from the bottom going up and return boolean with height. 

=end
def is_balanced(root)

    def dfs(root)
        return [true, 0] if root.nil?

        left, right = dfs(root.left), dfs(root.right)
        balanced = left[0] && right[0] && (left[1] - right[1]).abs <= 1

        return [balanced, 1 + [left[1], right[1]].max]
    end

    return dfs(root)[0]    
end
