# 45.jump_game_ii.rb
# https://leetcode.com/problems/jump-game-ii/
# https://www.youtube.com/watch?v=dJ7sWiOoK7g
# @param {Integer[]} nums
# @return {Integer}
#
=begin

    greedy approach

    time: O(n)
        We iterate through the array once

    space: O(1)
        
    note:
        This uses a simplified version of BFS. We use L and R to set the bounds. This is way over my head
        DOES NOT WORK
=end
def jump(nums)
    result = 0
    l = r = 0

    while r < nums.length - 1
        farthest = 0
        for i in (l..(r + 1)) do
            farthest = [farthest, i + nums[i]].max
            if i == l
                l = r + 1
                r = farthest
                result += 1 
            end
        end
    end

    return result
end

def jump(nums)
    result = 0
    l = r = 0
    
    (nums.size - 1).times do |i|
      l = [l, i + nums[i]].max
      if i == r
        result += 1
        r = l
      end
    end
    result
end