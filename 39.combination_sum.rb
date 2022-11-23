# 39.combination_sum.rb
# https://leetcode.com/problems/combination-sum/
# https://www.youtube.com/watch?v=GBKI9VSKdGg
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
#
=begin

    backtracking approach

    time: O(2^t)
        It's the height of the tree where t is the target.

    space:O(t/m)
        Where m is the minimum value among the candidates. 

    note:
        Try to draw the tree out I still could not figure this out because trying to remove duplicates was not easy.

=end
def combination_sum(candidates, target)
    @candidates = candidates
    @target     = target
    @res        = []

    # params:
    #   i: int index of current candidate being processed 
    #   cur: array current array or combination
    #   total: int current running total to match target
    #
    # return:
    #   A list of arrays of possible combination sums to target
    #
    def dfs(i, cur, total)
        # base cases
        # cur should be a copy we still need to use it for the rest of the dfs
        if total == @target
            @res.push(cur.clone) 
            return
        end

        # check bounds
        return if i >= @candidates.length || total > @target 

        # inorder traversal
        cur.push(@candidates[i])

        # left
        dfs(i, cur, total + @candidates[i])

        # root
        cur.pop() 

        # right
        dfs(i + 1, cur, total)

    end

    dfs(0, [], 0)
    return @res 
end