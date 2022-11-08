# 169.majority_element.rb
# @param {Integer[]} nums
# @return {Integer}
=begin

    hash approach

    time: O(n) we first iterate through all the elemtns in nums. This takes n
         time then, we iterate through all the keys in the hash looking for 
         the key with the largest value thus, O(n) + O(n) = O(2n) = O(n)

    space: O(n) since in the worst case we would have to store all the elements of 
        nums in the seen hash. 

=end
def majority_element(nums)
    seen        = {}
    n           = nums.length / 2  
    majority    = 1
   
    # check element frequency
    nums.each do |num| # O(n) times
        seen[num] = 1 + seen.fetch(num, 0)
    end   
    
    # check that frequency is greater than n
    seen.each do |see| 
        majority = see[0] if see[1] > n
    end

    return majority # O(n) times
end

=begin

    need code approach

    time: O(n) we first iterate through all the elemtns in nums. This takes n
         time then, we iterate through all the keys in the hash looking for 
         the key with the largest value thus, O(n) + O(n) = O(2n) = O(n)

    space: O(n) since in the worst case we would have to store all the elements of 
        nums in the seen hash. 

=end
def majority_element(nums)
    seen                = {}
    result = max_count  = 0
   
    nums.each do |num| 
        seen[num] = 1 + seen.fetch(num, 0)

        result = num if seen[num] > max_count

        max_count = [seen[num], max_count].max
    end   
    
    return result
end

=begin
    Boyer Moore Algorithm
        The problem assumes that there must be  majority element.
        We keep track of the maximum variable using a single variable and count.
        
        Given [2,2,1,1,1,2,2]

        1. 2, set result = 2 and count = 1 since 2 is the first element you see in the array.
        2. 2, result = 2 count = 2 since we have seen two 2's
        3. 1, result = 2 count = 1 since we have seen a new element 1 we decrement it one. 
        4. 1, result = 2 count = 0 
        5. 1, result = 1 count = 1 now we've set result to 1 since count was 0
        6. 2, result = 1 count = 0 seen a new number 
        7. 2, result = 3 count = 1

        return result 

    time: O(n) still need to iterate through all n elements

    space: O(1) 
=end
def majority_element(nums)
    count = result = 0

    nums.each do |n|
        result = n if count == 0
        count += 1 if result == n
        count -= 1 if result != n
    end

    return result
end
