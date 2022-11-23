# 55.jump_game.rb
# https://leetcode.com/problems/jump-game/
# https://www.youtube.com/watch?v=Yan0cv2cLy8
# @param {Integer[]} nums
# @return {Boolean}
#
=begin
    greedy approach

    time: O(n)

    space: O(1)

    note:
        0 We start at the end of the array. 
        1 Create a goal pointer starting at the end position
        2 If the previous element can reach the end move it towards the begging
        3 keep doing 1 and 2 until goal reaches the first index

=end
def can_jump(nums)
    goal = nums.length - 1
    
    (0..goal).reverse_each do |i|
        goal = i if i + nums[i] >= goal
    end

    return goal == 0 ? true : false
end

=begin
    brute force approach

    time: O(n^n)

    space:

    note:
    
=end
def can_jump(nums)
    
end

=begin
    DP approach

    time: O(n^2)

    space: 

    note:
        hold a cache of what you have seen so you don't go down a branch that has been computed
=end
def can_jump(nums)
    
end

