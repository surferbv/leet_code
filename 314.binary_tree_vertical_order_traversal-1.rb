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
# approach: bfs 
def vertical_order(root)
  q = []
  h = {}

  return [] if root.nil?

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


######
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
# approach: dfs
def vertical_order(root)
  @h = {}

  return [] if root.nil?
  node_pair = [root, 0]

  def dfs(node_pair)
    node, level = node_pair

    return if node.nil? 

    if @h.key?(level)
      @h[level].append(node.val)
      puts "appending node: #{node.val}"
    else
      @h[level] = [node.val]
      puts "first node: #{node.val}"
    end

    dfs([node.left, level - 1]) if node.left
    dfs([node.right, level + 1]) if node.right
  end

  dfs(node_pair)

  @h.sort_by{|k,v| k}.map{|pair| pair[1]}
end