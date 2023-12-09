# 314.binary_tree_vertical_order_traversal.rb
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
# @return {Integer[][]}
# 
# space: O(n)
# time: O(n) + 
def vertical_order(root)
  q = [] # bfs
  h = {} # to order nodes based on level key: level value: [nodes]

  return [] if root.nil?

  # [node, level]
  q.prepend([root, 0])

  while !q.empty?
    node, level = q.pop()

    if h.key?(level)
      h[level].append(node.val)
    else
      h[level] = [node.val]
    end

    q.prepend([node.left, level - 1]) if node.left
    q.prepend([node.right, level + 1]) if node.right
  end

  h.sort_by{|k,v| k}.map{|pair| pair[1]}
end