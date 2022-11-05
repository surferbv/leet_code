# 108.convert_sorted_array_to_binary_search_tree.rb
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}
#
# recursive approach (dfs pre-order choose left middle as root)
#
# About pre-order
# node -> left -> right
# [root.val] + preorder(root.left) + preorder(root.right) 
# 
# time: O(n) where n is the length of nums. 
#
# space: O(log n) for the recusion stack for the tree to be hight-balanced.
def sorted_array_to_bst(nums)
    @nums = nums
       
    def bst_helper(l, r)
        return nil if l > r
        
        mid         = (l + r) / 2 # always choose the left middle as root
        root        = TreeNode.new(@nums[mid])
        root.left   = bst_helper(l, mid - 1) 
        root.right  = bst_helper(mid + 1, r) 

        return root
    end

    return bst_helper(0, @nums.length - 1)
end

# recursive approach (dfs pre-order choose right middle as root)
#
# About pre-order
# node -> left -> right
# [root.val] + preorder(root.left) + preorder(root.right) 
# 
# time: O(n) where n is the length of nums. 
#
# space: O(log n) for the recusion stack for the tree to be hight-balanced.
def sorted_array_to_bst(nums)
    @nums = nums
       
    def bst_helper(l, r)
        return nil if l > r
        
        mid         = (l + r) / 2
        mid         += 1 if (l + r).odd? # choose right middle as root 
        root        = TreeNode.new(@nums[mid])
        root.left   = bst_helper(l, mid - 1) 
        root.right  = bst_helper(mid + 1, r) 

        return root
    end

    return bst_helper(0, @nums.length - 1)
end


# recursive approach (dfs pre-order choose random middle node as root)
#
# About pre-order
# node -> left -> right
# [root.val] + preorder(root.left) + preorder(root.right) 
# 
# time: O(n) where n is the length of nums. 
#
# space: O(log n) for the recusion stack for the tree to be hight-balanced.
def sorted_array_to_bst(nums)
    @nums = nums
       
    def bst_helper(l, r)
        return nil if l > r
        mid         = (l + r) / 2
        mid         += rand(0..1) if (l + r).odd? # choose a randome middle node as root 

        root        = TreeNode.new(@nums[mid])
        root.left   = bst_helper(l, mid - 1) 
        root.right  = bst_helper(mid + 1, r) 

        return root
    end

    return bst_helper(0, @nums.length - 1)
end

=begin
    Constructing a BST from an ascending ordered list and why it is not unique. 
    Inorder traversal is not unique identifier of a BST. At the same time
    both pre-order and post-order traversals are unique identifiers of BST. 

    Thus a sorted array to a bst has multiple solutions why?
    Because even with the height restriction with having the three height-balanced 
    all you need to do choose left middle element, or right middle one, and both 
    choices will lead to different height-balanced BSTs. Let's see that in 
    practice: in Approach 1 we will always pick up left middle element, in 
    Approach 2 - right middle one. That will generate different BSTs but both 
    solutions will be accepted.
=end