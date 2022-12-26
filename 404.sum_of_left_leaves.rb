=begin

    title:
        404. Sum of Left Leaves

    links:
        https://leetcode.com/problems/sum-of-left-leaves/

    approach:
        dfs approach    

    time: O(n)

    space: O(n)

    note:
        Use DFS with any order traversal. In this case we used in order traversal
        we visit the left, root, than right. 

    til:
        You can also do this using BFS, post-order, and pre-order traversal. 

    results:
        Runtime 84 ms Beats 69.57% Memory 211.1 MB Beats 47.83%

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
# @return {Integer}
def sum_of_left_leaves(root)
    @sum = 0

    def sum_left(node)
        if node
            if node.left 
                @sum += node.left.val if node.left.left.nil? && node.left.right.nil?
            end
            sum_left(node.left)
            sum_left(node.right)
        end
    end

    sum_left(root)
    return @sum
end