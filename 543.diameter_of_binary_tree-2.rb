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
# notes:
# could not finish had too look at solution most was correct except for line 24 and 26
def diameter_of_binary_tree(root)
    @diameter = 0

    def dfs(root)
        return 0 if root.nil?

        left = dfs(root.left)
        right = dfs(root.right)

        @diameter = [@diameter, left + right].max # why plus one? 

        1 + [left, right].max # why this line?
    end

    dfs(root)
    @diameter
end