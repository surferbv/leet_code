# 167. Two Sum II - Input Array Is Sorted
# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers = [2,7,11,15], target = 9)
    l, r = 0, numbers.length - 1

    while l < r 
        cur_sum = numbers[l] + numbers[r]

        break if cur_sum == target

        if target < cur_sum # goofed up here 
            r -= 1
        else
            l += 1
        end
    end
    
    [l+1, r+1]
end
    