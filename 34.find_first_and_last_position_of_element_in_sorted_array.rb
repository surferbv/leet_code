# 34.find_first_and_last_position_of_element_in_sorted_array.rb
# https://www.youtube.com/watch?v=4sQL7R5ySUU
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
#
=begin
=end
def search_range(nums, target)
    left_idx    = binary_search(nums, target, true)
    right_idx   = binary_search(nums, target, false)
    return [left_idx, right_idx]
end

# left_bias takes true or false. If left_bias is passed false it will return right_bias
def binary_search(nums, target, left_bias)
    l = 0
    r = nums.length - 1
    i = -1
    while l <= r
        mid = (l + r) / 2
        guess = nums[mid]

        if guess == target
            i = mid
            if left_bias
                r = mid - 1
            else
                l = mid + 1
            end
        end

        if guess > target
            r = mid - 1
        else
            l = mid + 1
        end
    end

    return i
end






=begin
    DNW
=end
def search_range(nums, target)
    result = [-1, -1]
    l = 0
    r = nums.length - 1

    while l <= r
        mid = (l + r) / 2

        guess = nums[mid]

        if guess == target
            
            result = [mid, mid + 1] if nums[mid + 1] == target
                
            result = [mid - 1, mid] if nums[mid - 1] == target

            return result.sort()
        end

        if guess > target
            r = mid - 1
        else
            l = mid + 1
        end 

    end
    
    return result
end
