=begin

    112. Path Sum (easy)

    approach: 
        dfs approach

    links: 
        https://leetcode.com/problems/path-sum/
        https://www.youtube.com/watch?v=LSKQyOz_P8I

    time: O(n)
        Worst case we would have to visit all the nodes which don't sum up to the target. 
    
    space: O(log n)
        In the worst case the tree is not balance thus O(n)
        Best case the tree is balanced thus O(log n) and since it is based on 
        the problem then it's O(log n)

    note: 
        The solution I came up with passes the target_sum down using DFS but 
        there's some clever solutions that subtract from the target without
        having to create a helper method and instead use recursion on the
        existing method call. There is also a way to do this iteratively i.e. BFS

    til:
        You can sum track from the total to also get to the solution. 

=end
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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
    curr_sum = 0

    def dfs_hps(curr_sum, root)
        return false if root.nil?

        curr_sum += root.val

        if root.left.nil? && root.right.nil?
            if curr_sum == target_sum
                return true
            else
                return false
            end
        end

        return dfs_hps(curr_sum, root.left) || dfs_hps(curr_sum, root.right)
    end
   
    return dfs_hps(curr_sum, root)
end