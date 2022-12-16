=begin

    78. subsets (medium)

    approach:
        back tracking approach

    time:
        O(n 2 ^ n )

    space:
        O(n)

    note:
        Backtracking for each step we can either add the element or not add the element. 

    til:
        For each element you ask yourself whether or not you should include the itme. 

=end
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets( nums )
    @res    = []
    @subset = []
    @nums   = nums

    def dfs( i )
        if i >= @nums.length
            @res.append @subset.clone
            return
        end

        # to include nums[ i ]
        @subset.append @nums[ i ]
        dfs( i + 1 )    

        # to not incldue nums[ i ]
        @subset.pop()
        dfs( i + 1 )
    end
    dfs(0)
    return @res
end