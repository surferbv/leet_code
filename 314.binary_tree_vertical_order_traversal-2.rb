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
# approach: BFS
# time: O(n) since we visit each node at most once and we iterate throught all the keys in the hash
# space: O(n) for the size of the hash and result which we are not counting  
def vertical_order(root)
  q = []  # but will use as a q by performing the following operations .pop to dequeue and .preprend to enqueue
          # e.g. we store a pair [0, root] 
  h = {}  # store our columsn or x values k: columns, values: node.val 
          # e.g. {0 => [3,4]}

  return [] if root.nil?

  q.prepend([0, root])

  min_col = Float::INFINITY # you can think of this as columns or x coordinates
  max_col = -Float::INFINITY

  while !q.empty?

    column, node = q.pop

    min_col = [min_col, column].min
    max_col = [max_col, column].max

    if h.key?(column)
      h[column].append(node.val)
    else
      h[column] = [node.val]
    end

    # left child
    q.prepend([column - 1 , node.left]) if node.left

    # right child
    q.prepend([column + 1, node.right]) if node.right
  end

  res = []

  (min_col).upto(max_col) do |i|
    res.append(h[i])
  end

  res.compact
end