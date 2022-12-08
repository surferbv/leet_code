# 872 leaf similar tress (easy)
# trees
# https://leetcode.com/problems/leaf-similar-trees/
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
=begin

    inorder dfs appraoch 

    time: O(T1 + T2)
        Where T1 is the number of nodes of tree one and T2 is the number of nodes in the second tree.
 
    space: O(LN1 + LN2)
        LN1 are all the leaf nodes in T1 and LN2 are all the leaf nodes in T2. 

    note:
        You know you are at a leaf node when both the left and right are nil so store it into a list.
        Use dfs as it will visit all the nodes we did this using inorder traversal but any traversal would
        be fine as you need to just compare the nodes values at the end. Another clever way to solve this 
        without passing arrays into the recursive call is to use yield and then generate a list of nodes
        on the caller. I didn't do it that way as I don't understand how yield works. 

=end
def leaf_similar(root1, root2)  
    seq1, seq2 = [], []  
    inorder_dfs(root1, seq1) == inorder_dfs(root2, seq2)
end

def inorder_dfs(node ,seq)
    if node
        seq << node.val if node.left.nil? && node.right.nil?
        inorder_dfs(node.left, seq)
        inorder_dfs(node.right, seq)
    end

    return seq
end
