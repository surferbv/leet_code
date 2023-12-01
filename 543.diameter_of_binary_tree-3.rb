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
# - we use recusion to solve this problem
# - use dfs
# - how do we keep track of the max diameter? Global variabl?
def diameter_of_binary_tree(root)
   @diameter = 0 # this will hold the max diameter don't forget to set it to a class variable

   def dfs(root)
    # base case if the root is nil should we assum that a node of nil has 
    # a height of 0 and a single node a height of 1? 
    return 0 if root.nil? # let us assume zero

    # at this point we need to keep trakc of hte hight and hte diameter from each node
    # how do we do this?

    left = dfs(root.left)
    right = dfs(root.right)

    # some questions about this line...
    # Q: why + 1 ? and why left + right to get the max diameter?
    # A: We don't need to + 1 this is done on the last line of the dfs method 
    #    As for why left + right TBD   
    # Q: we are trying to cound the number of edges, how does this help?
    # A: My hunch is that the largest diametert will be the diamter of the 
    #    entire tree. left + right will be the locall diamter.  
    @diameter = [@diameter, left + right].max 

    # some other work to be done here I'm not sure what
    # Q: Why the max of left right? 
    # A: 1 + because we are account for the case when a node children
    #    are nil thus they for a single node the diameter is 1
    1 + [left, right].max
   end

   dfs(root)
   @diameter
end