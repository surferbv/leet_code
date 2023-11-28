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
def diameter_of_binary_tree(root)
    @max = 0 # not sure why you need to store this in an array as what Navi did

    def dfs(root)

        # base case if the root is nil
        return -1 if root.nil? # we return the height of the empty tree thought it be 0

        # recursive case
        left    = dfs(root.left)
        right   = dfs(root.right) 

        # as we start to climb up
        # how do we find the hight

        @max = [@max , 2 + left + right].max # why 2? 
    
        # the height running through the root node?
        return 1 + [left, right].max 
    end

    dfs(root)
    return @max
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
# @return {Integer}
def diameter_of_binary_tree(root)
    @diameter = 0
    def dfs(root)
        return 0 if root.nil?

        left = dfs(root.left)
        right = dfs(root.right)

        @diameter = [@diameter, left + right].max

        return 1 + [left, right].max 
    end

    dfs(root)
    return @diameter
end