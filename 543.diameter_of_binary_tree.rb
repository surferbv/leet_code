#543.diameter_of_binary_tree.rb
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
=begin

    recursive approach

    time: O(n)
        We only touch every node at most once since we enter from its parent.
        In a binary tree a child has only one direct parent.

    space: O(n)
        The space depends on the implicit calls to the call stack during our 
        DFS traversal. In the worst case the tree has all it's children on one side. 
    
    note: 
        Could not solve this maybe try it out using bfs or 
        DFS or not using global. 

=end
def diameter_of_binary_tree(root)
    @diameter = 0    
    
    def longest_path(root)
        return 0 if root.nil?

        @diameter # non local 

        # recursively find the longest path in both the left and right children
        left_path = longest_path(root.left)
        right_path = longest_path(root.right)

        # update the diameter if the left_path + right_path is larger
        @diameter = [@diameter, left_path + right_path].max

        # return the longest between left and right
        # remember to add 1 for the patch connecting the node and its parent
        return [left_path, right_path].max + 1
    end

    longest_path(root)
    return @diameter
end



=begin

    WRONG!

    Algorithm:
        From the root keep going down the left child children counting the number of edges.
        Once you have reached the left child as nil return with the left count.
        From the root keep going down the right childs children counting the number of edges.
        Once you have reached the left child as nil return with the right count.
        Once both have returend sum the left and right count and return result.

        the height of the left sub tree and the height of the left sub tree
=end
def diameter_of_binary_tree(root)                           call 1          call 2          call 3
    right_count, left_count = 0, 0                          l = r = 0       l = r = 0       l = r = 0

    return 1 if root.left.nil? && root.right.nil?           false           false           true return 1

    if root.left                                                                            call 2
        left_count += 1                                     l = 1           l = 1           
        left_count += diameter_of_binary_tree(root.left)    root.left = 2   root.left = 4   l = 1 + 1 = 2
    end

    if root.right                                                                           true 3
        right_count += 1                                                                    
        right_count += diameter_of_binary_tree(root.right)
    end   
end
