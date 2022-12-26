=begin

    title:  
        270.closest_binary_search_tree_value.rb

    links:
        https://leetcode.com/problems/closest-binary-search-tree-value/

    approach:
        bfs approach

    time: O(n)
        In the worst cast we have a unbalanced tree that has degraded to a list.
        In this case we have to compare all the nodes values with the closest.

    space: O(n)
        Similar to the time complexity we'd have to add all the nodes to the queue
        where the structure of the bst is a list.

    note:
        Use bfs or dfs either would work. 

    til:
        Using a sentinel value and the properties of BST are useful when solving this. 

    results:
        Runtime 94 ms Beats 100% Memory 211.6 MB Beats 83.33%

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
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
    closest = Float::INFINITY
    result  = -1
    queue   = [] # pop and prepend

    # base case if the graph is empty or has only one node
    return root.val if root.nil? || ( root.left.nil? && root.right.nil? )

    queue.prepend(root)

    while !queue.empty?
        node = queue.pop

        if node
            # we try to find the smallest distance between the target and the node.val
            curr_dist = [ closest, ( node.val - target ).abs ].min

            if curr_dist < closest
                result  = node.val 
                closest = curr_dist
            end

            # here we are using the properties of the BST (i.e. root.left.val < root.val < root.right.val)
            if target < node.val
                queue.prepend( node.left )
            else
                queue.prepend( node.right )
            end
        end
    end

    return result
end