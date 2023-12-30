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
    return 0 if root.nil? # nodes that are nil will return 0 height 

    # now we recurs all the way down the tree
    l = dfs(root.left) 
    r = dfs(root.right) 

    # now that we have reached the bottom we can calculate the diamter of the tree
    # but we want the largest
    @diameter = [l + r, @diameter].max
    
    # if a node is not nil it's diameter is 1 so we add 1
    return [l,r].max + 1
  end

  dfs(root)
  @diameter  
end