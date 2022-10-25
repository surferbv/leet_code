# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#
# brute force
# time: O(n^2) since we have to iterate over the array twice in order to find all possible sums for the target.
# space: O(1) no additional data structures are allocated besides the array. 
# def two_sum(nums, target)
#     for i in (0..nums.length - 1) do
#         for j in (1..nums.length - 1) do
#             return [i,j] if nums[j] == target - nums[i] && i != j
#         end
#     end
#     return []
# end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#
# hash technique two pass
# time: O(n) since we have to iterate over all n items in the array well actually O(n + n) = O(2n) = O(n)
# space: O(n) we are using a hash to store the complements and the indicies we have seen. 
# def two_sum(nums, target)
#     seen = {}
#     for i in (0..nums.length - 1) do
#         seen[nums[i]] = i
#     end

#     for i in (0..nums.length - 1) do
#         complement = target - nums[i]
#         return [i, seen[complement]] if seen.key?(complement) && seen[complement] != i  
#     end

#     return []
# end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#


def two_sum(nums, target)
    seen = {}
    for i in (0..nums.length - 1) do
        complement = target - nums[i]
        if seen.key?(complement) && seen[complement] != i  
            return [i, seen[complement]] 
        else
            seen[nums[i]] = i
        end
    end
    return []
end

 



# test cases 
a = [1,2] 
t = 3
print "#{two_sum(a, t)} ?= [0,1]"
puts

a = [2,2] 
t = 3
print "#{two_sum(a, t)} ?= []"
puts

a = [2,7,11,15] 
t = 9
print "#{two_sum(a, t)} ?= [0,1]"
puts

a = [3,2,4]
t = 6
print "#{two_sum(a, t)} ?= [1,2]"
puts

a = [3,3]
t = 6
print "#{two_sum(a, t)} ?= [0,1]"
puts

a = [2,5,5,11]
t = 10
print "#{two_sum(a, t)} ?= [1,2]"
puts